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
function Bin2Dropbox {
	rsync -av --delete ~/bin/ ~/Dropbox/conf-files/chromebook-bin/
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
    echo "[2] Backup bin directory to Dropbox"
    echo "[3] Show calendar"
    echo "[4] Start editor to write letters"
    echo "[5] DoFileLatexmk"    
    echo "[6] DoFileXelatex"
    echo "[7] DoPandoc"
    echo "[8] Exit/Stop"
    echo "======================="
    echo -n "Enter your menu choice [1-8]: "
    read yourch
    case $yourch in
#      1) echo "Today is `date` , press a key. . ." ; read ;;
       1)  SayHello ; echo "Press a key . . ." ; read ;;
      2) Bin2Dropbox; echo "press a key . . ." ; read ;;
      3) cal ; echo "Press a key. . ." ; read ;;
      4) WriteLetter ;;
      5) dofilelatexmk ;;
      6) dofilexelatex ;;
      7) doPandoc ;read ;; 
      8) exit 0 ;;
      *) echo "Opps!!! Please select choice 1,2,3,4,5,6, or 7";
         echo "Press a key. . ." ; read ;;
 esac
done
