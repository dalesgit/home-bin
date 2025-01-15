#!/bin/bash
# This is the file for Mac/Linux
#$ cat > menuui
#
# Script to create simple menus and take action according to that selected
# menu item
# function egs
Commit=$(date +%Y-%m-%d-%T)  # The "+%s" option to 'date' is GNU-specific.
function DoSync {
rsync -avzh /home/dale/Downloads/git/ /home/dale/Dropbox/git/
}
function DoResync {
rsync -avzh  /home/dale/Dropbox/git/ /home/dale/Downloads/git
}
Editor=emacs
function DoLatex {
~/bin/dolatexmenu.sh
}
function SayHello {
   echo "Hello $LOGNAME, Have nice computing"
   return
}
function Bin2Dropbox {
	rsync -av --delete ~/bin/ ~/Dropbox/conf-files/chromebook-bin/
}
function EmacsConf {
cp ~/.emacs ~/.emacs.d/ 
rsync -av --delete ~/.emacs.d/  ~/Dropbox/conf-files/emacs-conf/chromebook-emacs/
}
function WriteLetter {
	ddate=letterhead
szAnswer=$(zenity --entry --text "Who are you writing?" --entry-text "$ddate"); echo $szAnswer
pdate=`date +%y%m%d%H%M`;
cd ~/Dropbox/latexdocs/newlatexletter
cp ~/Dropbox/latexdocs/newlatexletter/defaultletter.tex ~/Dropbox/latexdocs/newlatexletter/$szAnswer$pdate.tex
#cd ~/newlatexletter
emacs ~/Dropbox/latexdocs/newlatexletter/$szAnswer$pdate.tex
}
function Dropboxmenu {
emacs ~/Dropbox/diary-org/diary.org
}
function Gitmenu {
emacs ~/Dropbox/git/diary-git/diary-git.org
}
function doPandoc {
echo "this is pandoc"
	/home/dale/bin/dopandoc.sh
}
function CommitGit {
cd ~/Downloads/git/diary-git
git add . -A
git commit -m "$Commit"
git  push https://github.com/dalesgit/diary-org master
}
function EditFile {
cd ~/bin
$Editor new-emacs-menu.sh
}
function PullGit {
cd ~/Downloads/git/diary-git
git  pull https://github.com/dalesgit/diary-org master
}
function JustPush {
cd ~/Downloads/git/diary-git
git  push https://github.com/dalesgit/diary-org master
}
#
DoSync
#
while :
 do
    clear
    echo "-------------------------------------"
    echo " Main Menu "
    echo "-------------------------------------"
    echo "[1] Test function"
    echo "[2] Backup bin directory to Dropbox"
    echo "[3] Start editor to write letters"
    echo "[4] Orgmode Dropboxmenu"
    echo "[5] Orgmode Gitmenu"
    echo "[6] DoPandoc"
    echo "[7] Pull Git"
    echo "[8] Commit Git"
    echo "[9] Just Push"
    echo "[a] Backup Emacs config"
    echo "[b] Edit this file"
    echo "[c] Sync Chromebox to Linux"
    echo "[d] Sync to Chromebox when leaving Linux"
    echo "[e] Do Latex Menu"
    echo "[f] Exit/Stop"    
    echo "======================="
    echo -n "Enter your menu choice ...: "
    read yourch
    case $yourch in
#      1) echo "Today is `date` , press a key. . ." ; read ;;
       1)  SayHello ; echo "Press a key . . ." ; read ;;
      2) Bin2Dropbox; echo "press a key . . ." ; read ;;
      3) WriteLetter ;;
      4) Dropboxmenu ;;
      5) Gitmenu ;;
      6) doPandoc ;read ;; 
      7) PullGit ;echo "Press return key";read;;
      8) CommitGit ;echo "Press return key";read;;
      9) JustPush ;echo "Press return key";read;;
      a) EmacsConf ;echo "Press return key";read;;
      b) EditFile ;echo "Press return key";read;;
      c) DoSync ;echo "Press return key";read;;
      d) DoResync ;echo "Press return key";read;;
      e) DoLatex ;echo "Press return key";read;;
      f) DoSync ;echo "synced" ;exit 0 ;;
      *) echo "Opps!!! Please select choice ...";
         echo "Press return key. . ." ; read ;;
 esac

done
#rsync -avzh /home/dale/Downloads/git /home/dale/Dropbox/git/
#echo "rsynced"
