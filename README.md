# OSS-Audit-24BAI10462
# Author: Rishabh Kumar | Reg No: 24BAI10462
**Course:** Open Source Software (NGMC)  
**Chosen Software:** Python  

---

## What this is

This repo is my submission for the OSS Capstone project. I picked Python as my software — partly because I use it regularly in my academic work, and partly because the story behind it is genuinely compelling: a language designed to bridge the gap between "too simple" and "too technical," shaped entirely by a global community rather than a corporation.

The repo has five shell scripts that cover the practical Linux side of the project. The written report is submitted separately as a PDF on the VITyarthi portal.

---

## Scripts

### script1_system_identity.sh
Displays a formatted system identity report showing the software under audit (Python), current date, hostname, distribution, kernel version, logged-in user, home directory, uptime, Python version, binary location, and PSF license details.

Run it:
```bash
chmod +x script1_system_identity.sh
./script1_system_identity.sh
```

**Output:**

![System Identity Report Output](Screenshot_2026-03-30_at_11_47_52_PM.png)

---

### script2_package_inspector.sh
Checks whether Python is installed on the system and displays PSF license information. On systems where Python is not found, it shows the install command. Also prints a summary comparing PSF vs GPL licensing.

Run it:
```bash
chmod +x script2_package_inspector.sh
./script2_package_inspector.sh
```

**Output:**

![FOSS Package Inspector Output](Screenshot_2026-03-30_at_11_56_17_PM.png)

---

### script3_disk_auditor.sh
Audits key Linux directories (`/usr/lib/python3`, `/usr/bin`, `/etc`, `/home`, `/tmp`, `/var/log`) and reports their size, permissions, owner, and group. Also checks Python's site-packages location, lists the first 10 installed packages, and prints binary permission details.

Run it:
```bash
chmod +x script3_disk_auditor.sh
./script3_disk_auditor.sh
```

**Output:**

![Disk and Permission Auditor Output](Screenshot_2026-03-31_at_12_02_34_AM.png)

---

### script4_log_analyzer.sh
Reads a log file, counts lines matching a given keyword, and prints the last 5 matching lines. Exits with an error message if the specified log file is not found — prompting you to create one in the compiler environment.

Run it:
```bash
chmod +x script4_log_analyzer.sh
./script4_log_analyzer.sh logfile.txt error
```

If you don't have a log file ready, create a `logfile.txt` in the same directory with some sample log entries before running.

**Output:**

![Log File Analyzer Output](Screenshot_2026-03-31_at_12_07_04_AM.png)

---

### script5_manifesto.sh
Takes four arguments — Project, Community, Problem, and Your Name — and generates a personalised open-source philosophy manifesto saved to a `.txt` file. Exits with a usage prompt if any argument is missing.

Run it:
```bash
chmod +x script5_manifesto.sh
./script5_manifesto.sh "Python" "developers worldwide" "readable code" "Rishabh Kumar"
```

**Output:**

![Open Source Manifesto Generator Output](Screenshot_2026-03-31_at_12_12_47_AM.png)

---

## Dependencies

Just bash and standard Linux utilities — nothing extra to install. `dpkg` or `rpm` should be present for script 2 (standard on any mainstream Linux distro).

Tested on Ubuntu 24.04.3 LTS.

---

## Notes

- All scripts need execute permission (`chmod +x`) before running
- Script 4 requires an actual log file path as an argument — it will exit with an error if the file is not found
- Script 5 requires all four arguments to be passed — it will print usage instructions and exit if any are missing
