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
    echo "2. BEHAT - Execute all tests (composer install, build-dev, install-clean, behat --profile=clean --strict)"
    echo "3. BEHAT - List all steps available (include result in new file called behat-steps.txt)."
    echo "4. TOOLKIT - Run PHP code sniffer"
    echo "5. TOOLKIT - Run PHPMD"
    echo "6. TOOLKIT - Run PHP code autofixing"
    echo "7. DRUPAL CONTRIB MODULES - Check updates available."
    echo "8. COMPOSER - Update composer.lock file."
    echo "9. COMPOSER - Validate composer.lock file."
    echo "10. DRUSH GENERATE - Show available commands."
    echo "11. DRUSH GENERATE - generate new custom module."
    echo "12. MSQL - Open terminal."
    echo "13. Restore vendor folder (remove vendor folder, composer install)"
    echo "14. Exit"
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
    echo "Execute BEHAT tests"
    red=`tput setaf 1`
    reset=`tput sgr0`

    read -p "Be carefull, if you press enter button, start this process, but ${red}First of all execute install-clean command${reset}" var
    if [ ${#var} -eq 0 ]; then
        composer install
        vendor/bin/run toolkit:build-dev
        vendor/bin/run toolkit:install-clean
        vendor/bin/behat --profile=clean --strict
    fi
}

action3() {
    vendor/bin/behat -dl | tee behat-steps.txt
}

action4() {
    vendor/bin/run toolkit:test-phpcs
}

action5() {
    vendor/bin/run toolkit:test-phpmd
}

action6() {
    vendor/bin/run toolkit:run-phpcbf
}

action7() {
    composer outdated "drupal/*"
}

action8() {
    composer update --lock
}

action9() {
    composer validate
}

action10() {
    drush generate
}

action11() {
    drush generate module
}

action12() {
    drush sql:cli
}

action13() {
    rm -rf vendor
    composer install
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
            echo "Exiting the program"
            break
            ;;

        *)
            echo "Invalid option"
            ;;
    esac

    echo
done
