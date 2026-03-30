%%bash
# ============================================================
# Script 1: System Identity Report
# Author: E NEHAAL | Reg No: 24MEI10057
# Course: Open Source Software | Unit: 1 & 2
# Description: Displays a welcome screen with system info
#              and open-source license details of the OS.
# ============================================================

# Student and project variables
STUDENT_NAME="E NEHAAL"
REG_NO="24MEI10057"
SOFTWARE_CHOICE="Git"

# Gather system information using command substitution
KERNEL=$(uname -r)                        # Kernel version
DISTRO=$(lsb_release -d | cut -f2-)       # Distribution name
USER_NAME=$(whoami)                        # Current logged-in user
HOME_DIR=$HOME                             # Home directory of current user
UPTIME=$(uptime -p)                        # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')      # Formatted current date
CURRENT_TIME=$(date '+%H:%M:%S')          # Current time

# --- Display the identity report ---
echo "========================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY"
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Reg No    : $REG_NO"
echo "  Software  : $SOFTWARE_CHOICE (Licensed under GPL v2)"
echo ""
echo "--------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "--------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged In As : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "--------------------------------------------------------"
echo "  OS LICENSE INFORMATION"
echo "--------------------------------------------------------"

#Check if lsb_release is available and show license info
echo "  This system runs Linux, which is licensed under the"
echo "  GNU General Public License version 2 (GPL v2)."
echo "  GPL v2 guarantees four fundamental freedoms:"
echo "    [0] Freedom to run the program for any purpose"
echo "    [1] Freedom to study and modify the source code"
echo "    [2] Freedom to redistribute copies"
echo "    [3] Freedom to distribute modified versions"
echo ""
echo "========================================================"
echo "  'Free software is a matter of liberty, not price.'"
echo "                               — Richard Stallman"
echo "========================================================"
