#!/bin/sh

# state=`mocp -i | egrep  'State: [A-Z]+'`
# state=`mocp -i | grep State: | sed  '/(PLAY|PAUSE)/p'`
state=`mocp -Q %state`

if [ $state = "PLAY" ]; then
    mocp -
else
    echo "MOCP is pausing"
fi
