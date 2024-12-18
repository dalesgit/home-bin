#!/bin/bash
# https://askubuntu.com/questions/1146166/bash-how-to-create-a-menu-with-submenu
# submenu
submenu () {
  local PS3='Please enter sub option: '
  local options=("Sub menu item 1" "Sub menu item 2" "Sub menu quit")
  local opt
  select opt in "${options[@]}"
  do
      case $opt in
          "Sub menu item 1")
              echo "you chose sub item 1"
              ;;
          "Sub menu item 2")
              echo "you chose sub item 2"
              ;;
          "Sub menu quit")
              return
              ;;
          *) echo "invalid option $REPLY";;
      esac
  done
}

# main menu
PS3='Please enter main option: '
options=("Main menu item 1" "Submenu" "Main menu quit")
select opt in "${options[@]}"
do
    case $opt in
        "Main menu item 1")
            echo "you chose main item 1"
            ;;
        "Submenu")
            submenu
            ;;
        "Main menu quit")
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
