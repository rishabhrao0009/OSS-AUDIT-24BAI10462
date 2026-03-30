#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor — Python Edition
# Audits Python directories, config files, and site-packages
# ============================================================

# Key Python-related directories on Ubuntu
DIRS=("/usr/lib/python3" "/usr/bin" "/etc" "/home" "/tmp" "/var/log")

# Python's site-packages: where pip installs third-party libraries
# Use python3 to find the exact path dynamically
SITE_PACKAGES=$(python3 -c "import site; print(site.getsitepackages()[0])" 2>/dev/null)

echo "========================================================"
echo "  Disk and Permission Auditor — Python Edition"
echo "========================================================"
echo ""
printf "  %-28s %-12s %-30s\n" "Directory" "Size" "Permissions  Owner  Group"
echo "  -----------------------------------------------------------------------"

# --- for loop: check each directory ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        printf "  %-28s %-12s %-30s\n" "$DIR" "${SIZE:-N/A}" "$PERMS"
    else
        printf "  %-28s %-12s\n" "$DIR" "[not found]"
    fi
done

echo ""
echo "  --- Python Site-Packages (pip install location) ---"
if [ -n "$SITE_PACKAGES" ] && [ -d "$SITE_PACKAGES" ]; then
    SIZE=$(du -sh "$SITE_PACKAGES" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$SITE_PACKAGES" | awk '{print $1, $3, $4}')
    echo "  Path : $SITE_PACKAGES"
    echo "  Size : $SIZE"
    echo "  Perm : $PERMS"
    echo ""
    echo "  First 10 installed packages:"
    # List the directory contents (each is a package or .dist-info folder)
    ls "$SITE_PACKAGES" 2>/dev/null | head -10 | while read -r pkg; do
        echo "    - $pkg"
    done
else
    echo "  site-packages path not found or not accessible."
fi

echo ""
echo "  --- Python Binary Permission Detail ---"
# stat: detailed file metadata; -c with format string extracts specific fields
# %A = permissions string, %U = owner name, %G = group, %s = size in bytes
PYBIN=$(which python3)
if [ -n "$PYBIN" ]; then
    stat -c "  File: %n | Perms: %A | Owner: %U | Group: %G | Size: %s bytes" "$PYBIN"
fi

echo ""
echo "========================================================"
