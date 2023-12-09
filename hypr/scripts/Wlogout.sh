#!/bin/bash

# Start wlogout in the background
wlogout

# Capture the PID of the wlogout process
wlogout_pid=$!

# Wait for up to 30 seconds for wlogout to exit gracefully
timeout 30s tail --pid $wlogout_pid -f /dev/null

# If wlogout is still running after the timeout, forcefully kill it
if ps -p $wlogout_pid > /dev/null; then
  kill -KILL $wlogout_pid
fi
