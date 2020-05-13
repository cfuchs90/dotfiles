#!/bin/sh

if [ -f "$1" ]; then
    echo "$1"
else
    echo "No argument given or argument is not a file"
    exit 1
fi


