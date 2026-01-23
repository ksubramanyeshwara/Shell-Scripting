#!/bin/bash

# checking if text exist in a file using grep, if and based on exit code show the result

# vim sample.txt
grep "Hello exit code!" sample.txt
if [ $? -eq 0 ]
then
    echo "Pattern Found!"
else
    echo "Pattern Not Found!"
fi

# Install the package without asking user permission and give the exit code

#package=htop
package=notexist
sudo apt install -y $package >> package_install.log # redirecting output to a log file
# sudo -v && sudo apt install -y $package | sudo tee -a package_install.log # redirecting output to a log file and showing on terminal if the error occurs for password use sudo -v &&
echo "The exit code for the package install is: $?"
# The exit code is 0 because, by default, a pipeline (|) returns the exit status of the last command in the chain


# custom exit code Using exit codes in automation / CI

./deploy.sh
if [ $? -eq 0 ]
then
    echo "Deployment Successful!"
else
    echo "Deployment Failed!"
    exit 1
fi

# exit ends the script completely, Anything written after it is ignored.
echo "Deployment script finished."
echo "Exit code for deployment script: $?"
echo "Continuing with other tasks..."
