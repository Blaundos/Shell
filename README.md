# Shell
Linux Bash Shell Script for Archiving Log Files in Local Machine and Remote Machine

# Prerequisites
Will required to configure SSH Keygen To the Remote Hosts
Important: Do not give Password to the Keygen file

# Directory Structure Created By the Script
/var/log/test_log4j

Archive/<File with 7 Days From The Date of Run>/<File with 7 Days From The Date of Run>.tar.gz

# Testing
In Machine 1 and 2 Create two log files with older dates inside "/var/log/test_log4j”
This can change also needs to change in Script and .txt file as well

touch -a -m -t 202111011205.09 log-2021-11-01.log
