# oss-audit-24MEI10057

## The Open Source Audit — Git (GPL v2)

Student:E NEHAAL  
Registration Number:24MEI10057  
Course: Open Source Software (OSS NGMC)  
Chosen Software:Git — Version Control System  
License:GNU General Public License v2 (GPL v2)

---

## About This Project

This repository is part of the OSS Capstone Project (The Open Source Audit). It contains five shell scripts that demonstrate practical Linux skills while exploring the open-source philosophy behind **Git** — the distributed version control system created by Linus Torvalds in 2005.

---

## Repository Structure

```
oss-audit-24MEI10057/
├── README.md         ← You are here
├── script1.sh        ← System Identity Report
├── script2.sh        ← FOSS Package Inspector
├── script3.sh        ← Disk and Permission Auditor
├── script4.sh        ← Log File Analyzer
└── script5.sh        ← Open Source Manifesto Generator
```

---

## Script Descriptions

### Script 1 — System Identity Report
Displays a welcome screen showing the Linux distribution, kernel version, current user, home directory, system uptime, date/time, and the open-source license of the OS (GPL v2).

Concepts used:Variables, `echo`, command substitution (`$()`), `uname`, `lsb_release`, `whoami`, `uptime`, `date`, basic output formatting.

---

### Script 2 — FOSS Package Inspector
Checks whether `git` is installed on the system using `dpkg`, prints its version, size, and license, and uses a `case` statement to display a philosophy note about the package.

Concepts used: `if-then-else`, `case` statement, `dpkg -l`, `dpkg-query`, `apt-cache show`, `grep`, `awk`, pipe operations.

---

### Script 3 — Disk and Permission Auditor
Loops through a list of critical system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/share/doc`) and reports their permissions, owner/group, and disk usage. Also audits Git-specific paths.

Concepts used: `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, `which`, conditional checks with `[ -d ]` and `[ -f ]`.

---

### Script 4 — Log File Analyzer
Reads a log file line by line, counts how many lines contain a specified keyword (default: `error`), prints a summary, and displays the last 5 matching lines. Includes a retry loop for missing or empty files.

Concepts used:`while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`), `grep -i`, `tail`, `exit`, retry logic.

Usage:
```bash
./script4.sh /var/log/syslog error
./script4.sh /var/log/dpkg.log install
```

---

### Script 5 — Open Source Manifesto Generator
Interactively asks three questions using `read`, then composes and saves a personalised open-source philosophy statement to a `.txt` file. Demonstrates string concatenation and file writing.

Concepts used:`read` for user input, string concatenation, writing to file with `>` and `>>`, `cat` to display output, `date` command, alias concept (commented demonstration).

---

## How to Run the Scripts on Linux (Ubuntu/Debian)

### Step 1 — Clone the repository
```bash
git clone https://github.com/<enehaal>/oss-audit-24MEI10057.git
cd oss-audit-24MEI10057
```

### Step 2 — Make scripts executable
```bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
```

### Step 3 — Run each script

```bash
# Script 1: System Identity Report
./script1.sh

# Script 2: FOSS Package Inspector
./script2.sh

# Script 3: Disk and Permission Auditor
./script3.sh

# Script 4: Log File Analyzer (pass a log file path and optional keyword)
./script4.sh /var/log/syslog error
./script4.sh /var/log/dpkg.log install

# Script 5: Open Source Manifesto Generator (interactive)
./script5.sh
```

---

## Dependencies

| Dependency | Purpose | Install Command |
|------------|---------|-----------------|
| `git` | Required for Script 2 | `sudo apt install git` |
| `lsb-release` | Distro name in Script 1 | `sudo apt install lsb-release` |
| `dpkg` / `apt` | Package info in Script 2 | Pre-installed on Ubuntu/Debian |
| `du`, `ls`, `awk` | Directory audit in Script 3 | Pre-installed (coreutils) |
| `grep`, `tail` | Log analysis in Script 4 | Pre-installed (grep / coreutils) |

All scripts are designed for Ubuntu / Debian systems. They use `dpkg` and `apt` for package management.

---

## Chosen Software: Git

Git is a free and open-source distributed version control system created by Linus Torvalds in April 2005. It is licensed under the GNU General Public License version 2 (GPL v2), which guarantees the four fundamental freedoms: to run, study, modify, and distribute the software.

Why Git? Git was born from necessity — when the proprietary version control system BitKeeper revoked its free licence from the Linux kernel community, Torvalds built a replacement in days. It is now the global standard for version control, used by tens of millions of developers worldwide.

## Academic Integrity

All scripts and report content are original work by **E NEHAAL (24MEI10057)**. Scripts were written, tested, and documented independently as part of the OSS Capstone Project requirements.
