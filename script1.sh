#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Chosen Software: Python (PSF License)
# ============================================================

STUDENT_NAME="RISHABH KUMAR"
ROLL_NUMBER="24BAI10462"
SOFTWARE="Python"

# uname -r: kernel version
KERNEL=$(uname -r)

# whoami: current username
USER_NAME=$(whoami)

# uptime -p: human readable uptime
UPTIME=$(uptime -p)

# hostname: machine name
HOSTNAME=$(hostname)

# date: formatted date and time
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')

# Read distro name from OS release file
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

# Get Python version (python3 --version outputs to stdout)
PYTHON_VERSION=$(python3 --version 2>&1)

# Get Python binary path
PYTHON_PATH=$(which python3)

echo "========================================================"
echo "       OPEN SOURCE AUDIT — System Identity Report"
echo "       Student: $STUDENT_NAME | Roll: $ROLL_NUMBER"
echo "========================================================"
echo ""
echo "  SOFTWARE UNDER AUDIT : $SOFTWARE"
echo "  Date                 : $CURRENT_DATE"
echo ""
echo "--------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "--------------------------------------------------------"
echo "  Hostname         : $HOSTNAME"
echo "  Distribution     : $DISTRO"
echo "  Kernel Version   : $KERNEL"
echo "  Logged-in User   : $USER_NAME"
echo "  Home Directory   : $HOME"
echo "  System Uptime    : $UPTIME"
echo ""
echo "--------------------------------------------------------"
echo "  PYTHON INFORMATION"
echo "--------------------------------------------------------"
echo "  Python Version   : $PYTHON_VERSION"
echo "  Binary Location  : $PYTHON_PATH"
echo "  PSF License      : Python Software Foundation License v2"
echo "  License Type     : Permissive (allows commercial use)"
echo ""
echo "--------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "--------------------------------------------------------"
echo "  Python is licensed under the PSF License."
echo "  You have the freedom to use, study, modify, and"
echo "  distribute Python freely — even in commercial products."
echo "  This is what makes Python the world's most popular"
echo "  programming language today."
echo ""
echo "========================================================"
