#!/bin/bash
function doLogseq {
	rclone mount pcloud-files:documents ~/rclone-drives/pcloud-files --vfs-cache-mode writes &
}
function doObsidian {
	rclone mount dalesgdrive:markdown ~/rclone-drives/gdrive &
 }
function doObsidian-libreary {
	rclone mount dropbox-files:obsidian ~/rclone-drives/dropbox-files &
}
function doObsidian {
	flatpak run md.obsidian.Obsidian &
}
function doWiki-vim {
	/home/dale/applications/Zettlr-2.3.0-arm64.AppImage &
}


while :
 do
    clear
    echo "-------------------------------------"
    echo " Main Menu "
    echo "-------------------------------------"
	echo "[1] Run Obsidian"
	echo "[2] Run Logseq"
	echo "[3] Run Chromium browser"
	echo "[4] Run Zettlr"
	echo "-------------------------------------"
    echo "[5] Markdown files in GDrive"
    echo "[6] Org files in Pcloud"
    echo "[7] Obsidian files in Dropbox"
    echo "-------------------------------------"
    echo "[8] Pandoc script"
    echo "[9] Backup-rsync script"    
    echo "[b] Edit this file"
    echo "[c] geany"
    echo "[f] Exit/Stop"    
    echo "======================="
    echo -n "Enter your menu choice ...: "
    read yourch
    case $yourch in
    1) doObsidian ; read ;;
    2) doLogseq ; read ;;
    3) doChromium ; read ;;
    4) doZettlr : read ;;
    5) doGdrive ; read ;;
    6) doPcloud ; read ;;
    7) doDropbox ; read ;;
    8) ~/bin/do-pandoc-yad.sh ;;
    9) ~/bin/do-rsync-3.sh ;;       
    b) geany ~/bin/do-menu.sh ;;
    c) geany ;;
    f) exit 0 ;;
      *) echo "Opps!!! Please select choice ...";
         echo "Press return key. . ." ; read ;;
 esac

done
