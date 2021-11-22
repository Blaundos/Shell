#————————————————————

# Script for archiving of logs.

# Script          : test1.sh

# 19-11-2021 Vinod Amarathunga

#————————————————————

#!/bin/sh

#Varibales Used:

LOGROOT="/var/log/test_log4j"
LOG="$LOGROOT/"
ARCHIVE="$LOGROOT/Archive/$(date -d "7 days ago" '+%d-%m-%y')_To_$(date +"%d-%m-%Y")"

#Create Archive Directory if Not Created Already
mkdir -p $ARCHIVE

#Find Log Files Older Than 7 Days and Copy to Archive Directory
find $LOG/* -mtime +7 -type f -print -exec cp {} $ARCHIVE \;

#This Compares Anything Missing on the Copied Files 
find $LOG/* -mtime +7 -type f -exec bash -c 'diff $t.out -rq --no-dereference "$@" "/var/log/test_log4j/Archive/$(date -d "7 days ago" '+%d-%m-%y')_To_$(date +"%d-%m-%Y")"| grep "[<>]" | sed "s/>/\t/g;s/<//g"' bash {} \;

#Tar Zip Copied Directory 
tar -czvf $ARCHIVE/$(date -d "7 days ago" '+%d-%m-%y')_To_$(date +"%d-%m-%Y").tar.gz $ARCHIVE

#Remove Older Files in Original Log Directory
find $LOGROOT/* -mtime +30 -type f -print -exec rm -R {} \;

echo "Done Localhost Moving to Remote Host"

#Define Servers to Remotly Login and Execute Archiving Example: servers=("10.0.0.2" "10.0.0.3")
servers=("10.0.0.5");

for s in "${servers[@]}"; do
echo "sshing root@${s} to run ${script}"
(ssh -t -t root@${s} < test.txt)&
done
wait
