%%bash
#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: E NEHAAL | Reg No: 24MEI10057
# Course: Open Source Software | Unit: 5
# Description: Interactively asks three questions and composes
#              a personalised open-source philosophy statement,
#              then saves it to a .txt file.
# ============================================================

# Alias concept demonstration 
# In an interactive shell, you might run:
#   alias today='date "+%d %B %Y"'
# Here we demonstrate it as a comment since aliases don't
# persist inside non-interactive scripts.

echo "========================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "       E NEHAAL | 24MEI10057"
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open-source philosophy manifesto."
echo ""
echo "--------------------------------------------------------"
echo ""

#  Collect user input interactively using 'read' 

# Question 1: A tool they use daily
read -p "  1. Name one open-source tool you use every day: " TOOL

echo ""

# Question 2: What freedom means to them
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

echo ""

# Question 3: Something they'd build and share
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""
echo "  Generating your manifesto..."
echo ""

# Date stamp for the manifesto 
DATE=$(date '+%d %B %Y')

# Output filename based on current username 
OUTPUT="manifesto_$(whoami).txt"

#  Compose the manifesto using string concatenation and echo >>
# Clear/create the output file first
> "$OUTPUT"

# Write header to file
echo "========================================================" >> "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  By: E NEHAAL (24MEI10057)" >> "$OUTPUT"
echo "  Generated on: $DATE" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the personalised manifesto paragraph
echo "  Every day, I rely on $TOOL — a tool that exists not" >> "$OUTPUT"
echo "  because a corporation decided to sell it, but because"
echo "  someone chose to build it openly and share it with the" >> "$OUTPUT"
echo "  world. To me, the word that captures the spirit of open"
echo "  source is '$FREEDOM'. That single word is why I believe"
echo "  developers have a responsibility that goes beyond just"
echo "  writing code — we have a responsibility to share it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  One day, I will build $BUILD and release it freely." >> "$OUTPUT"
echo "  Not for profit, not for credit, but because the software" >> "$OUTPUT"
echo "  I use today was built by people who did the same for me." >> "$OUTPUT"
echo "  Standing on the shoulders of giants means I must, in" >> "$OUTPUT"
echo "  turn, become a shoulder for those who come after." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I commit to writing code with comments, sharing what I" >> "$OUTPUT"
echo "  know, contributing to communities that gave me tools," >> "$OUTPUT"
echo "  and choosing openness over secrecy whenever I can." >> "$OUTPUT"
echo "  This is my open source manifesto." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — E NEHAAL | $DATE" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"

#  Confirm the file was saved 
echo "  [OK] Manifesto saved to: $OUTPUT"
echo ""
echo "--------------------------------------------------------"
echo "  YOUR MANIFESTO:"
echo "--------------------------------------------------------"
echo ""

# Display the saved manifesto to screen 
cat "$OUTPUT"

echo ""
echo "========================================================"
echo "  'Given enough eyeballs, all bugs are shallow.'"
echo "                               — Eric S. Raymond"
echo "========================================================"

