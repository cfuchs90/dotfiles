#!/bin/sh

choice=`echo $'Yes\n No'` | dmenu -i -p "Shutdown?"
echo $choice
