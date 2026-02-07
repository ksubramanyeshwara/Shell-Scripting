#!/bin/bash

# Function definition
greet(){
    echo "Hello World!"
}

# Call the function
greet

# Function with parameters
greet_person(){
    echo "Hello, $1!"
}

# Call the function with an argument
greet_person "Alice"

# Function with return value
add(){
    return $(($1 + $2))
}

# Call the function and capture the return value
add 5 3
result=$?
echo "Result: $result"
