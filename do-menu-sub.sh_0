#!/bin/bash
# https://askubuntu.com/questions/1146166/bash-how-to-create-a-menu-with-submenu
# submenu
# https://opensource.com/article/22/6/make-temporary-file-bash
temp_file=$(mktemp)
function doPcloud {
	rclone mount pcloud-drive:documents ~/rclone-drives/pcloud-drive --vfs-cache-mode writes &
}
function doGdrive {
	rclone mount gdrive:markdown ~/rclone-drives/gdrive &
}
function doDropbox {
	rclone mount dropbox-files:obsidian ~/rclone-drives/dropbox-files &
}
function doRnote {
	flatpak run com.github.flxzt.rnote
}
function doStatus {
	onedrive --display-sync-status > $temp_file;
	view $temp_file;
	    rm "${temp_file}"
}
function doSynchronize {
	onedrive --synchronize;
		view $temp_file;
		    rm "${temp_file}"
}
submenu () {
  local PS3='Please enter sub option: '
  local options=("Rclone Gdrive" "Rclone Dropbox" "Rclone Pcloud" "Rclone Submenu quit")
  local opt
  clear
  select opt in "${options[@]}"
# dropbox gdrive pcloud
  do
      case $opt in
          "Rclone Gdrive")
              doGdrive
              ;;
          "Rclone Dropbox")
              doDropbox
              ;;
          "Rclone Pcloud")
              doPcloud
              ;;
          "Rclone Submenu quit")
              return
              ;;
          *) echo "invalid option $REPLY";;
      esac
      clear
  done
}
submenu2 () {
  local PS3='Please enter sub option: (Return if needed) '
  local options=("Edit This File" "Geany"  "Edit Submenu quit")
  local opt
  clear
  select opt in "${options[@]}"
  do
      case $opt in
          "Edit This File")
              geany ~/bin/do-menu-sub.sh
              ;;
          "Geany")
              geany
              ;;
          "Edit Submenu quit")
              return
              ;;
          *) echo "invalid option $REPLY";;
      esac
      clear
  done
}

# main menu
PS3='Please enter main option: (Return if needed) '
options=("Run Obsidian" "Run Logseq" "Run Abiword" "RcloneSubmenu" "OnedriveSync" "OnedriveStatus" "EditSubmenu" "Main menu quit")
clear
select opt in "${options[@]}"
do
    case $opt in
        "Run Obsidian")
            flatpak run md.obsidian.Obsidian & 
# How to redirect the messages that I get. Maybe doesn't matter.
#            >"${tempfile:=$(mktemp)}"
#            2>/dev/null 

            ;;
        "Run Logseq")
            flatpak run com.logseq.Logseq &
            ;;
        "Run Abiword" )
			flatpak run com.abisource.AbiWord
            ;;
        "RcloneSubmenu")
            submenu
            ;;
        "OnedriveSync")
			doSynchronize
			;;
		"OnedriveStatus")
		doStatus
			;;
        "EditSubmenu")
            submenu2
            ;;
        "Main menu quit")
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
    rm "${temp_file}"
    clear
done



