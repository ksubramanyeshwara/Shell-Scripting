#!/bin/bash

# variable
name="K Subramanyeshwara"
echo "User name is ${name}"

# read input from user
echo "Enter your age:"
read age
echo "Your age is ${age}"

#!/bin/bash

# 1. Use -p to get a input in a single line
read -p "1. Enter your Name: " name

# 2. Use -s (Silent) to read input secretly (password)
read -sp "2. Enter a Secret Password: " pass
echo -e "\n(Hiding it works! Password saved privately.)"

# 3. Use -n 1 (Number) to read number of characters to move further
read -n 1 -p "3. Proceed with setup? [y/n]: " choice
echo -e "\n(See? It moved forward without you hitting Enter!)"

# 4. Use -t 5 (Timeout) Wait for X seconds. If the user doesn't type anything by then, just move on.
read -t 5 -p "4. Final step: Type 'ok' in 5 seconds or I will close: " final
echo -e "\nScript Finished. Hello $name!"

