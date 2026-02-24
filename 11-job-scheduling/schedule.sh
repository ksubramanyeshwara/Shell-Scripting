#!/bin/bash

logfile=job_scheduling_results.log

echo "The script ran at the following time: $(date)" >> $logfile

/usr/bin/echo "The script ran at the following time: $(/usr/bin/date)" >> $logfile