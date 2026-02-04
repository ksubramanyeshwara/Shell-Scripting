#!/bin/bash

###########################################################################
# Script Name: update.sh
# Description: This script updates an Ubuntu system by checking for upgradable
#              packages, upgrading them, cleaning up unnecessary packages,
#              and removing old packages based on user confirmation.
# Usage: Run the script in a terminal. It will prompt for user confirmation
#        before performing each action.
###########################################################################

# Check for the OS release file
release_file=/etc/os-release

# Check if the system is Ubuntu
if grep -q "Ubuntu" $release_file
then
    echo "This is an Ubuntu system."
    # Update package lists
    echo "Updating the system..."
    sudo apt update

    # Check for upgradable packages
    echo "Checking for upgradable packages..."
    sudo apt list --upgradable
    
    # Ask the user if they want to upgrade the packages
    read -r -p "Do you want to upgrade the packages? (y/n): " answer
    
    if [ "${answer,,}" == "y" ] # accepts both y and Y
    then
        # Upgrade packages if user agrees
        echo "Upgrading packages..."
        sudo apt upgrade
        echo "Upgrade completed."
    else
        # Inform the user if they choose not to upgrade
        echo "Upgrade cancelled by user."
    fi
    
    # Ask the user if they want to clean up unnecessary packages
    read -r -p "Do you want to clean up unnecessary packages? (y/n): " answer
    if [ "${answer,,}" == "y" ]
    then
        # Clean up unnecessary packages if user agrees
        echo "Cleaning up unnecessary packages..."
        sudo apt autoremove
        echo "Cleanup completed."
    else
        # Inform the user if they choose not to clean up
        echo "Cleanup cancelled by user."
    fi

    # Ask the user if they want to remove old packages
    read -r -p "Do you want to remove old packages? (y/n): " answer
    if [ "${answer,,}" == "y" ]
    then
        # Remove old packages if user agrees, Removes cached obsolete package files, Frees disk space
        echo "Removing old packages..."
        sudo apt autoclean
        echo "Removal completed."
    else
        # Inform the user if they choose not to remove old packages
        echo "Removal cancelled by user."
    fi

    # Inform the user that the update process is completed
    echo "Update process completed."
else
    # Inform the user if the system is not Ubuntu
    echo "This is not an Ubuntu system."
fi

# Inform the user that the script execution is finished
echo "Script execution finished."

#############################################################################
# Parameter Expansion = Variable + Operation
# ${variable operation}
# ${answer} = variable
# ${answer,} = lowercase first character
# ${answer,,} = lowercase all characters
# ${answer^^} = uppercase all characters
# ${answer^} = uppercase first character

# -r, -p in read command
# -r : raw input, do not treat backslashes as escape characters
# -p : prompt string to display before reading input
#############################################################################