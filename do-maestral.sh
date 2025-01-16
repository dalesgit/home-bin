#!/bin/bash
#
# cf. the egs below
# https://maestral.app/docs/installation 
# python3 -m maestral  status
# python3 -m maestral excluded remove dropsyncfiles
# python3 -m venv maestral-venv
# (maestral-venv)$ python3 -m pip install --upgrade maestral
# python3 pip3 install maestral[gui]
# /home/dale/Applications/maestral/maestral-venv/lib/python3.9/site-packages/
# $ python3 -m venv maestral-venv 
# $ source maestral-venv/bin/activate (maestral-venv)
# $ python3 -m pip install --upgrade maestral
#
# Go to the maestral Directory
# MaestralPath=${0%/*}
MaestralPath="/home/dale/Applications/maestral/maestral-venv/lib/python3.9/site-packages/"
cd "$MaestralPath" #&& cd ..
#export WINEPREFIX="$PWD/wine"
#export WINEDEBUG="-all"
echo ""
echo ""
echo "Moving to the directory to run Maestral"

while true; do
menu_launch="$(zenity --width 309 --height 240 --list \
	--radiolist --column "Choose" --column "Option" FALSE "Dropbox start"\
	 TRUE "Dropbox status" FALSE "Dropbox stop" FALSE "Exit")"
if [ "$menu_launch" = "Exit" ]; then
echo done
exit
elif [ "$menu_launch" = "Dropbox start" ]; then
python3 -m maestral  start
elif [ "$menu_launch" = "Dropbox status" ]; then
python3 -m maestral  status
elif [ "$menu_launch" = "Dropbox stop" ]; then
python3 -m maestral  stop
else
clear
echo Invalid option
fi
done


#cd  /home/dale/Applications/maestral/maestral-venv/lib/python3.9/site-packages/
#python3 -m maestral  start
