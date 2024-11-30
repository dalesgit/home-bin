#!/bin/bash

FILE=`yad --file-selection --filename=$PWD/ --title="Select a File to convert with pandoc"`

thelist=$(<~/bin/mylist)
theOutlist=$(<~/bin/myOutlist)
# choose input filetype
Fint=$(yad --title="What kind of file are we converting from?" --width=200 --height=200 --list --column="Values" --separator="" $thelist)
# exit $(yad --title="You chose..." --text=$thechoice)
if [ $? = 1 ];
#zenity --error --text="There has been an error."
then exit
fi
# choose output filetype
Tint=$(yad --title="What kind of file are we converting to?" --width=200 --height=200 --list --column="Values" --separator="" $theOutlist)
if [ $? = 1 ];
#zenity --error --text="There has been an error."
then exit
fi

if [ $? = 1 ];
#zenity --error --text="There has been an error."
then exit
fi

Basefile=${FILE%*.*}
Txten=$Tint
if [ $Tint = "markdown" ]; then
Txten="md"
elif [ $Tint = "latex" ] ; then
Txten="tex"
elif [ $Tint = "beamer" ] ; then
Txten="tex"
else
Txten=$Tint
fi

pandoc  -f $Fint -t $Tint -s  $FILE -o $Basefile.$Txten 
if [ $? = 1 ];
#zenity --error --text="There has been an error."
then exit

fi
