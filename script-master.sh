#!/bin/bash
# this script is only valid for European Comision projects

show_menu() {
    current_folder=$(basename "$PWD")
    echo "##########################################################################"
    echo "Welcome to script-master execution script for project: $current_folder"
    echo "##########################################################################"
    echo
    echo "Select an option:"
    echo
    echo "1. TOOLKIT - Install clean (composer install, build-dev, install-clean, drush uli)"
    echo "18. Exit"
    echo
    echo "(In all executions from drush and toolkit, this script at finally disable monolog module, because if the site doesn't have any home page, uli doesn't work properly)"
    echo
}

action1() {
    echo "Performing Install clean"
    composer install
    vendor/bin/run toolkit:build-dev
    vendor/bin/run toolkit:install-clean
    drush uli
}

action2() {

}

action3() {
}

action4() {
}

action5() {
}

action6() {
}

action7() {
}

action8() {
}

action9() {
}

action10() {
}

action11() {
}

action12() {
}

action13() {
}

action14() {
}

action15() {
}

action16() {
}

action17() {
}

# Main script loop
while true; do
    show_menu

    # Get user input
    read -p "Enter the option number: " option
    echo

    # Evaluate the selected option
    case $option in
        1)
            action1
            ;;
        2)
            action2
            ;;
        3)
            action3
            ;;
        4)
            action4
            ;;
        5)
            action5
            ;;
        6)
            action6
            ;;
        7)
            action7
            ;;
        8)
            action8
            ;;
        9)
            action9
            ;;
        10)
            action10
            ;;
        11)
            action11
            ;;
        12)
            action12
            ;;
        13)
            action13
            ;;
        14)
            action14
            ;;
        15)
            action15
            ;;
        16)
            action16
            ;;
        17)
            action17
            ;;
        18)
            echo "Exiting the program"
            break
            ;;

        *)
            echo "Invalid option"
            ;;
    esac

    echo
done
