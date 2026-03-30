%%bash
#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: E NEHAAL | Reg No: 24MEI10057
# Course: Open Source Software | Unit: 2 & 5
# Description: Reads a log file line by line, counts keyword
#              matches, and prints the last 5 matching lines.
# Usage: ./script4.sh /path/to/logfile [keyword]
# Example: ./script4.sh /var/log/syslog error
# ============================================================

# --- Read command-line arguments ---
# Original: LOGFILE=$1                   # First argument: path to log file
# Original: KEYWORD=${2:-"error"}        # Second argument: keyword (default: 'error')

# Fixed: Set LOGFILE and KEYWORD directly for correct execution 
LOGFILE="/var/log/dpkg.log"
KEYWORD="installed"

# Counter variable for keyword matches 
COUNT=0

echo "========================================================"
echo "         LOG FILE ANALYZER"
echo "========================================================"
echo ""

#  Validate that a log file path was provided 
# This block is now mostly for illustrative purposes, as LOGFILE is hardcoded.
# However, it ensures the script's logic is sound if LOGFILE were dynamic.
if [ -z "$LOGFILE" ]; then
    echo "  [!!] Usage: $0 /path/to/logfile [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# Retry loop: attempt up to 3 times if file is missing or empty 
RETRY=0
MAX_RETRIES=3

while [ $RETRY -lt $MAX_RETRIES ]; do
    # Check if the file exists
    if [ ! -f "$LOGFILE" ]; then
        echo "  [Attempt $((RETRY+1))/$MAX_RETRIES] File not found: $LOGFILE"
        RETRY=$((RETRY + 1))

        # Try a fallback log file on the last retry
        if [ $RETRY -eq $MAX_RETRIES ]; then
            echo ""
            echo "  [FALLBACK] Trying /var/log/dpkg.log as alternative..."
            LOGFILE="/var/log/dpkg.log"
            if [ ! -f "$LOGFILE" ]; then
                echo "  [!!] Fallback file also not found. Exiting."
                exit 1
            else
                echo "  [OK] Using fallback file: $LOGFILE"
                break
            fi
        fi
        sleep 1
        continue
    fi

    # Check if the file is empty
    if [ ! -s "$LOGFILE" ]; then
        echo "  [Attempt $((RETRY+1))/$MAX_RETRIES] File is empty: $LOGFILE"
        RETRY=$((RETRY + 1))
        sleep 1
    else
        # File exists and has content — exit the retry loop
        break
    fi
done

echo ""
echo "  Analyzing : $LOGFILE"
echo "  Keyword   : '$KEYWORD'"
echo ""
echo "  Scanning lines..."
echo ""

#  Read the log file line by line using a while-read loop 
while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each match
    fi
done < "$LOGFILE"

#  Summary output 
echo "  -------------------------------------------------------"
echo "  RESULT: Keyword '$KEYWORD' found $COUNT times in:"
echo "  $LOGFILE"
echo "  -------------------------------------------------------"
echo ""

# Show the last 5 matching lines for context 
if [ $COUNT -gt 0 ]; then
    echo "  Last 5 lines containing '$KEYWORD':"
    echo ""
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH; do
        echo "    >> $MATCH"
    done
else
    echo "  [INFO] No lines matched keyword '$KEYWORD' in the log file."
    echo "  Try a different keyword like: warning, info, fail, install"
fi

echo ""
echo "========================================================"
echo "  TIP: Linux logs are open and readable by design —"
echo "  transparency is a core open-source value."
echo "========================================================"

