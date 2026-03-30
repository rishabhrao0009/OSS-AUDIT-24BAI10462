#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator — Python Edition
# Interactive script — asks questions, generates a philosophy
# statement, and saves it to a file with your name.
# ============================================================

DATE=$(date '+%d %B %Y')
OUTPUT="python_manifesto_$(whoami).txt"

echo "========================================================"
echo "  Python Open Source Manifesto Generator"
echo "  Answer 4 quick questions — your statement will be saved"
echo "========================================================"
echo ""

# --- Interactive input using read -p ---
read -p "  1. One Python project or library you admire (e.g. NumPy): " PROJECT
echo ""

read -p "  2. One word that describes the Python community: " COMMUNITY
echo ""

read -p "  3. One real-world problem you would solve with Python: " PROBLEM
echo ""

read -p "  4. Your full name (for the signature): " AUTHOR
echo ""

# --- Validate inputs ---
if [ -z "$PROJECT" ] || [ -z "$COMMUNITY" ] || [ -z "$AUTHOR" ]; then
    echo "  Error: Please answer all questions. Run the script again."
    exit 1
fi

echo "  Writing your manifesto..."
echo ""

# --- Write manifesto to file ---
# '>' creates or overwrites; '>>' appends without deleting
{
echo "========================================================"
echo "  PYTHON OPEN SOURCE MANIFESTO"
echo "  Author : $AUTHOR"
echo "  Date   : $DATE"
echo "========================================================"
echo ""
echo "  I believe in the Python way."
echo ""
echo "  Guido van Rossum did not have to share Python with the"
echo "  world. He chose to — because great tools belong to"
echo "  everyone. That one decision, made quietly in 1991,"
echo "  changed what humans could build."
echo ""
echo "  I admire $PROJECT because it shows what happens"
echo "  when skilled people collaborate without borders,"
echo "  without paywalls, and without asking permission."
echo ""
echo "  The Python community is $COMMUNITY — and that spirit"
echo "  is written into every PEP, every commit, and every"
echo "  'import antigravity' easter egg."
echo ""
echo "  My contribution will be to use Python to solve"
echo "  $PROBLEM — and when I do, I will share it."
echo ""
echo "  Because code that helps one person, shared openly,"
echo "  can help a million."
echo ""
echo "  -- Signed: $AUTHOR | $DATE --"
echo ""
echo "  'Beautiful is better than ugly.'"
echo "  'Simple is better than complex.'   — The Zen of Python"
echo "========================================================"
} > "$OUTPUT"    # all the { } block is redirected into $OUTPUT

# --- Display result ---
echo "  Saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo ""
echo "========================================================"
