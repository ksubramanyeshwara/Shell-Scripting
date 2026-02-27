#!/bin/bash
echo "Script started"
kp(){
    # Enter port number to be killed
    read -rp "Enter port number to kill: " port
    
    # Check if port number is valid
    if  [ -z "$port" ]; then
        echo "No port number entered. Exiting."
        return
    fi
    
    # Get port number from the first argument, and find the PID of the process using that port
    PID=$(lsof -ti:"$port")
    # Check if process exists
    if [ -z "$PID" ]; then
        echo "No process found on port $port"
        return
    fi
    # Kill the process gracefully
    if kill "$PID" 2>/dev/null; then
        echo "$PID gracefully killed on port $port"
    fi
    sleep 1

    # Check if process is still running. If it is, force kill it
    if ps -p "$PID" >/dev/null 2>&1; then
        kill -9 "$PID"
        echo "$PID forcefully killed on port $port"
    else
        echo "$PID on port $port is already stopped"
    fi
}
kp