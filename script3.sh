%%bash
#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: E NEHAAL | Reg No: 24MEI10057
# Course: Open Source Software | Unit: 2
# Description: Loops through key system directories and
#              reports permissions, ownership, and disk usage.
#              Also checks Git's config directory.
# ============================================================

#List of important system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/doc")

echo "========================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "========================================================"
echo ""
printf "  %-20s %-20s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "  ----------------------------------------------------------"

#Loop through each directory in the list
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists on this system
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3 "/" $4}')

        # Get human-readable size with du; suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output for each directory
        printf "  %-20s %-20s %-10s\n" "$DIR" "$PERMS ($OWNER)" "$SIZE"
    else
        # Directory doesn't exist on this machine
        printf "  %-20s %s\n" "$DIR" "[does not exist on this system]"
    fi
done

echo ""
echo "--------------------------------------------------------"
echo "  GIT-SPECIFIC DIRECTORY AUDIT"
echo "--------------------------------------------------------"
echo ""

#Check Git's global config file
GIT_GLOBAL_CONFIG="$HOME/.gitconfig"
if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [FOUND] Git global config : $GIT_GLOBAL_CONFIG"
    echo "  Permissions/Owner         : $PERMS"
else
    echo "  [INFO] No global .gitconfig found at $HOME/.gitconfig"
    echo "  Set it up with: git config --global user.name 'Your Name'"
fi

echo ""

#Check Git system-wide config
GIT_SYS_CONFIG="/etc/gitconfig"
if [ -f "$GIT_SYS_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_SYS_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [FOUND] Git system config  : $GIT_SYS_CONFIG"
    echo "  Permissions/Owner          : $PERMS"
else
    echo "  [INFO] No system-wide gitconfig found at /etc/gitconfig"
fi

echo ""

#Check where the git binary lives
GIT_BIN=$(which git 2>/dev/null)
if [ -n "$GIT_BIN" ]; then
    PERMS=$(ls -l "$GIT_BIN" | awk '{print $1, $3, $4}')
    echo "  [FOUND] Git binary         : $GIT_BIN"
    echo "  Permissions/Owner          : $PERMS"
    echo "  Git version                : $(git --version)"
else
    echo "  [!!] git binary not found in PATH. Install with: sudo apt install git"
fi

echo ""
echo "========================================================"
echo "  TIP: Open-source tools like Git are world-readable"
echo "  because transparency is part of the philosophy."
echo "========================================================"
