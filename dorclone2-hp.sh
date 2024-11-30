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
# cf. https://forum.rclone.org/t/how-to-rclone-mount-unmount-properly-without-fusermount-errors/33935/4
actionB() {
    echo "mount pcloud files"
rclone mount pcloud: ~/pcloud-drive --vfs-cache-mode writes &
    echo -n "Press enter to continue ... "
    read response

    return 1
}

actionC() {
   echo "mount obsidian files"
rclone mount dropbox:obsidian ~/dropbox-drive&
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
actionE() {
    echo "run Obsidian"
/home/dale/Downloads/Obsidian-0.14.6-arm64.AppImage&
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionF() {
    echo "mount markdown-archives folder"
rclone mount gdrive:markdown-archives ~/gdrive-archive&
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
    "4. Run Pandoc"
    "5. Run Obsidian"
    "6. mount markdown-archives folder"
    "Q. Exit  "
)

## Menu Item Actions
menuActions=(
    actionA
    actionB
    actionC
    actionD
    actionE
    actionF
    actionX
)

## Override some menu defaults
menuTitle=" Setup rclone with bash-menu"
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
