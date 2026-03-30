#!/bin/bash
# ============================================================
# Script 2: Python Package Inspector
# Checks Python installation details, pip, and key modules
# ============================================================

PACKAGE="python3"

echo "========================================================"
echo "  FOSS Package Inspector — Python Edition"
echo "========================================================"
echo ""

# --- Check if python3 is installed ---
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "  [STATUS] Python3 is INSTALLED on this system."
    echo ""

    # Show package details from dpkg
    echo "  --- Package Details (from dpkg) ---"
    dpkg -s "$PACKAGE" | grep -E "^(Version|Maintainer|Homepage|Description)" | \
        while IFS=: read -r key value; do
            echo "  $key :$value"
        done

    echo ""
    echo "  --- Python Runtime Info ---"
    echo "  Binary path     : $(which python3)"
    echo "  Reported version: $(python3 --version 2>&1)"

    # Check if pip3 is available
    echo ""
    echo "  --- pip (Package Installer) ---"
    if command -v pip3 &>/dev/null; then
        echo "  pip3 found      : $(which pip3)"
        echo "  pip3 version    : $(pip3 --version 2>&1)"
        echo ""
        echo "  --- Installed pip packages (first 10) ---"
        # pip3 list shows all installed packages; head -12 shows first 12 lines
        pip3 list 2>/dev/null | head -12
    else
        echo "  pip3 not found. Install with: sudo apt install python3-pip"
    fi

    echo ""
    echo "  --- Standard Library Modules Check ---"
    # Loop through important built-in modules and test each one
    for MODULE in os sys math json datetime random; do
        # python3 -c: run a short Python command; import will fail if module missing
        if python3 -c "import $MODULE" 2>/dev/null; then
            echo "  [OK] $MODULE"
        else
            echo "  [MISSING] $MODULE"
        fi
    done

else
    echo "  [NOT INSTALLED] python3 not found."
    echo "  To install: sudo apt update && sudo apt install python3"
fi

echo ""
echo "  --- PSF License Summary ---"
echo "  License    : Python Software Foundation License v2"
echo "  Type       : Permissive (NOT copyleft)"
echo "  Commercial : YES — companies can use Python in closed products"
echo "  Copyleft   : NO — modifications don't have to be shared"
echo "  Compare    : GPL = must share changes; PSF = can keep changes private"
echo ""
echo "========================================================"
