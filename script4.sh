#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer — Python Edition
# Scans a log file for Python-related keywords
# Usage  : ./log_analyzer.sh [logfile] [keyword]
# Example: ./log_analyzer.sh /var/log/syslog python
# ============================================================

LOGFILE="${1:-/var/log/syslog}"      # default to syslog if no arg given
KEYWORD="${2:-python}"               # default keyword is "python"
COUNT=0
ERROR_COUNT=0
WARNING_COUNT=0

echo "========================================================"
echo "  Log File Analyzer — Python Edition"
echo "========================================================"

# --- Validate file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  Error: '$LOGFILE' not found."
    echo ""
    echo "  Available log files on this system:"
    for f in /var/log/syslog /var/log/auth.log /var/log/kern.log /var/log/dpkg.log; do
        [ -f "$f" ] && echo "    $f"
    done
    exit 1
fi

echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD' (case-insensitive)"
echo "  Scanning..."
echo ""

# --- Read file line by line and count matches ---
while IFS= read -r LINE; do

    # Count lines matching our main keyword
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi

    # Also count error lines (useful for Python error analysis)
    if echo "$LINE" | grep -iq "error"; then
        ERROR_COUNT=$((ERROR_COUNT + 1))
    fi

    # Count warning lines
    if echo "$LINE" | grep -iq "warning"; then
        WARNING_COUNT=$((WARNING_COUNT + 1))
    fi

done < "$LOGFILE"

# --- Display summary ---
echo "  -----------------------------------------------"
echo "  SUMMARY"
echo "  -----------------------------------------------"
echo "  Lines with '$KEYWORD' : $COUNT"
echo "  Lines with 'error'    : $ERROR_COUNT"
echo "  Lines with 'warning'  : $WARNING_COUNT"
echo "  Total file size       : $(du -sh "$LOGFILE" | cut -f1)"
echo "  Last modified         : $(stat -c %y "$LOGFILE" | cut -d. -f1)"
echo ""

# --- Show last 5 lines matching keyword ---
echo "  --- Last 5 lines containing '$KEYWORD' ---"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "  No lines found containing '$KEYWORD'."
    echo "  Tip: Try a different keyword like 'apt', 'error', or 'install'."
else
    echo "$MATCHES" | while IFS= read -r LINE; do
        # ${LINE:0:100} — substring: start at 0, take 100 characters
        echo "  > ${LINE:0:100}"
    done
fi

echo ""
echo "  --- Open Source Note ---"
echo "  Python's error messages, interpreter logs, and pip logs"
echo "  are all open and human-readable — a key benefit of"
echo "  open-source software: full transparency in every layer."
echo ""
echo "========================================================"
