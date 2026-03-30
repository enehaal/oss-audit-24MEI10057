%%bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: E NEHAAL | Reg No: 24MEI10057
# Course: Open Source Software | Unit: 2
# Description: Checks if a package is installed, prints its
#              version and license, and shows a philosophy note.
# ============================================================

#Target package for this audit 
PACKAGE="git"

echo "========================================================"
echo "         FOSS PACKAGE INSPECTOR"
echo "========================================================"
echo ""
echo "  Checking package: $PACKAGE"
echo ""

#Check if the package is installed using dpkg 
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "  [OK] $PACKAGE is INSTALLED on this system."
    echo ""
    echo "  --- Package Details ---"

    # Extract version from dpkg output using grep and awk
    VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
    echo "  Version  : $VERSION"

    # Extract description from dpkg using grep and cut
    DESC=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{$1=$2=$3=$4=""; print $0}' | sed 's/^ *//')
    echo "  Summary  : $DESC"

    # Show installed size from dpkg-query
    SIZE=$(dpkg-query -W --showformat='${Installed-Size}\n' "$PACKAGE" 2>/dev/null)
    echo "  Size     : ${SIZE} KB (on disk)"

    # Show the license from apt-cache show
    LICENSE=$(apt-cache show "$PACKAGE" 2>/dev/null | grep -i "^License" | head -1)
    if [ -n "$LICENSE" ]; then
        echo "  $LICENSE"
    else
        echo "  License  : GPL v2 (GNU General Public License version 2)"
    fi
else
    # Package is NOT installed — inform the user
    echo "  [!!] $PACKAGE is NOT installed on this system."
    echo ""
    echo "  You can install it with:"
    echo "    sudo apt update && sudo apt install $PACKAGE"
fi

echo ""
echo "--------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTES"
echo "--------------------------------------------------------"
echo ""

# Case statement to print a philosophy note per package
case $PACKAGE in
    git)
        echo "  Git: Created by Linus Torvalds in 2005 when BitKeeper"
        echo "  revoked its free license from the Linux community."
        echo "  It is now the universal version control standard."
        echo "  Lesson: When proprietary tools fail the community,"
        echo "  the community builds something better — openly."
        ;;
    apache2 | httpd)
        echo "  Apache: The web server that helped build the open internet."
        echo "  It proved that community-driven development could power"
        echo "  the world's most critical infrastructure."
        ;;
    mysql | mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps."
        echo "  MySQL's dual-license model shows how open source and"
        echo "  commercial interests can coexist — and conflict."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight for an open, private web."
        echo "  Born from Netscape's dying source code, it proved that"
        echo "  community volunteers can challenge browser monopolies."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris, plays anything."
        echo "  A reminder that great software often starts as a"
        echo "  personal scratch-your-own-itch project."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by its community."
        echo "  From Guido's Christmas project to the world's most"
        echo "  popular language — pure open-source evolution."
        ;;
    *)
        echo "  $PACKAGE: Part of the open-source ecosystem that"
        echo "  powers the modern software world."
        ;;
esac

echo ""
echo "========================================================"
