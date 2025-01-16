#!/bin/bash
# This is to get a backup to usb hard drive of home directory
# to get list for excludes.txt
# find /home/home/dale/.*  -maxdepth 1 -type d > ~/bin/excludes.txt
fromDir1="/home/dale/"
fromDir1a="/home/dale/.config"

fromDir2="/mnt/chromeos/MyFiles/Downloads/"
fromDir2a="/mnt/chromeos/MyFiles/Downloads/"

toDir2="/mnt/chromeos/removable/SD-Card/asus-2-linux-downloads"
toDir1="/mnt/chromeos/removable/SD-Card/asus-2-linux"
toDir3="/mnt/chromeos/removable/SD-Card/backup"
toDir4="/mnt/chromeos/removable/SD-Card/backup-chromebook-downloads"
toDir4a="/mnt/chromeos/removable/SD-Card/backup-chromebook-downloads2"
toDir5="/mnt/chromeos/removable/USB Drive/backup-hp"
toDir6="/mnt/chromeos/removable/USB Drive/backup-hp/crostini"

incFrom="/home/dale/bin/rsync-include.txt"
excFrom="/home/dale/bin/rsync-exclude.txt"
incFrom2="/home/dale/bin/rsync-include2.txt"
excFrom2="/home/dale/bin/rsync-exclude2.txt"
files2="/home/dale/bin/rsync-files2.txt"

rsyncFiles="/home/dale/bin/rsync-files.txt"
#rsync -rt --info=progress2 --info=name0 "$src" "$dst" /home/dale/ --stats --exclude-from=/home/dale/bin/excludes.txt  /mnt/chromeos/removable/"SD Card"/asus-2-linux
#rsync -rt --info=progress2  --info=name0 "$src" "$dst" "$fromDir1"  --stats  --files-from=/home/dale/bin/rsync-files.txt  "$toDir1"


echo "Backing up from '$fromDir1'  "
#rsync -art --info=progress2  "$fromDir1" --include-from="$incFrom" --exclude-from="$excFrom"   "$toDir5/bin" "/home/dale/bin/Xresources-themes*"
# --info=progress2 --prune-empty-dirs  --list-only --exclude="/home/dale/*"
# exclude folder is found after pursuing the $fromDir
# prune-empty-dirs may be necessary to clean up
# the "v" option not really necessary except to see what's working
# rsync -rvt --info=progress2 --prune-empty-dirs    --exclude 'Xresources-themes**'    -- "$fromDir1a"#	    "$toDir5/test"

# the below seemed to work to exclude a subfolder
# escFrom2 contained "Xresources-themes/light" source ~/bin
#rsync -rvt --info=progress2 --prune-empty-dirs    --exclude-from="$excFrom2"     -- "$fromDir1a"	    "$toDir5/test"

# this worked well to exclude subdirectories of ".config"
rsync -rvt --info=progress2 --prune-empty-dirs    --exclude-from="$excFrom2"     -- "$fromDir1"	    "$toDir3/crostini"



# cf. https://www.linuxjournal.com/content/how-add-simple-progress-bar-shell-script
#
#rsync -rt --info=progress2 --info=name0 "$src" "$dst" /mnt/chromeos/MyFiles/Downloads/ --stats  --exclude-from=/home/dale/bin/excludes.txt  /mnt/chromeos/removable/"SD Card"/asus-2-linux-downloads

# using -a option (archive) preserves timestamp, permissions, etc.
echo "backing up Chromebook Downloads folder"
rsync -rvt --info=progress2  "$fromDir2"  "$toDir3/chrome"
