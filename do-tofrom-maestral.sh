#!/bin/bash
#$ cat > menuui
#
# Script to create simple menus and take action according to that selected
# menu item
# function egs
function SayHello {
   echo "Hello $LOGNAME, Have nice computing"
   return
}
function FromMaestral {
	rsync -azvh /home/dale/Dropbox-maestral/DropsyncFiles/ /mnt/chromeos/MyFiles/Downloads/cruise-baltic/Dropbox-maestral-working	
	rsync -azvh /home/dale/Dropbox-maestral/logseq-files/ /mnt/chromeos/MyFiles/Downloads/logseq-files
}
function ToMaestral {
	rsync -azvh /mnt/chromeos/MyFiles/Downloads/cruise-baltic/Dropbox-maestral-working/ /home/dale/Dropbox-maestral/DropsyncFiles
	rsync -azvh /mnt/chromeos/MyFiles/Downloads/logseq-files/ /home/dale/Dropbox-maestral/logseq-files
}
function doPandoc {
echo "this is pandoc"
	/home/dale/bin/dopandoc.sh
}
#
while :
 do
    clear
    echo "-------------------------------------"
    echo " Main Menu "
    echo "-------------------------------------"
    echo "[1] Test function"
    echo "[2] Sync from Maestral to working files (Chrome)"
    echo "[3] Sync from working files to Maestral (Dropbox)"
    echo "[4] DoPandoc"
    echo "[5] Exit/Stop"
    echo "======================="
    echo -n "Enter your menu choice [1-8]: "
    read yourch
    case $yourch in
#      1) echo "Today is `date` , press a key. . ." ; read ;;
       1)  SayHello ; echo "Press a key . . ." ; read ;;
      2) FromMaestral; echo "press a key . . ." ; read ;;
      3) ToMaestral; echo "Press a key. . ." ; read ;;
      4) dopandoc-yad.sh ;read ;; 
      5) exit 0 ;;
      *) echo "Opps!!! Please select choice 1,2,3,4,5,6, or 7";
         echo "Press a key. . ." ; read ;;
 esac
done
