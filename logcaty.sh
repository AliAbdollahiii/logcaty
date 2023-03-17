#!/bin/sh

# Set up variables for filtering and log file name
APP_PACKAGE_NAME="com.example.myapp"
LOG_FILENAME="myapp_logs.txt"

# Clear any existing logcat buffers
adb logcat -c

# Start logcat with filters and redirect output to a file
adb logcat -v time -s ${APP_PACKAGE_NAME} > ${LOG_FILENAME}

# Sort log entries by timestamp
sort -t ' ' -k 1,2 ${LOG_FILENAME} > ${LOG_FILENAME}.sorted

# Sort log entries by message priority
sort -t ' ' -k 4 ${LOG_FILENAME} > ${LOG_FILENAME}.sorted.by_priority

# Sort log entries by message tag
sort -t ' ' -k 5 ${LOG_FILENAME} > ${LOG_FILENAME}.sorted.by_tag

# Sort log entries by message content
sort -t ' ' -k 6 ${LOG_FILENAME} > ${LOG_FILENAME}.sorted.by_content
