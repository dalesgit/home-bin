#!/bin/bash
# https://github.com/barbw1re/bash-menu/blob/master/demo.sh
# Ensure we are running under bash
if [ "$BASH_SOURCE" = "" ]; then
    /bin/bash "$0"
    exit 0
fi

#
# Load bash-menu script
#
# NOTE: Ensure this is done before using
#       or overriding menu functions/variables.
#
. "bash-menu.sh"


################################
## Example Menu Actions
##
## They should return 1 to indicate that the menu
## should continue, or return 0 to signify the menu
## should exit.
################################
actionA() {
    echo "mount Markdown folder"
rclone mount gdrive:markdown ~/gdrive&
    echo -n "Press enter to continue ... "
    read response

    return 1
}

actionB() {
    echo "mount timimi wiki files"
rclone mount Pcloud:documents ~/pcloud-drive&
    echo -n "Press enter to continue ... "
    read response

    return 1
}

actionC() {
   echo "mount obsidian files"
rclone mount Dropbox:obsidian ~/dropbox-drive&
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionD() {
   echo "do pandoc"
/home/dale/bin/dopandoc-yad.sh
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionX() {
    return 0
}


################################
## Setup Example Menu
################################

## Menu Item Text
##
## It makes sense to have "Exit" as the last item,
## as pressing Esc will jump to last item (and
## pressing Esc while on last item will perform the
## associated action).
##
## NOTE: If these are not all the same width
##       the menu highlight will look wonky
menuItems=(
    "1. Gdrive"
    "2. Pcloud"
    "3. Dropbox"
    "4. Pandoc"
    "Q. Exit  "
)

## Menu Item Actions
menuActions=(
    actionA
    actionB
    actionC
    actionD
    actionX
)

## Override some menu defaults
menuTitle=" Demo of bash-menu"
menuFooter=" Enter=Select, Navigate via Up/Down/First number/letter"
menuWidth=60
menuLeft=25
menuHighlight=$DRAW_COL_YELLOW


################################
## Run Menu
################################
menuInit
menuLoop


exit 0
