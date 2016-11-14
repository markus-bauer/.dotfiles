#!/bin/bash

# DESCRIPTION
# search files with locate and dmenu.
# USAGE
# - Type an initial search. 
# - Choose from the search results with dmenu.
# - Script opens a terminal at chosen directory (or base-directory of chosen file)
# CUSTOMIZATION
# - numer of items that locate returns (set to 1000)
# - parameters of mlocate 

p=""
d=""

#(1) create the search string p (locate argument) with a dmenu prompt
#--- dmenu
#DMENU="dmenu -p locate: -l 20 -i -fn Hack-10"
#--- rofi

DMENU="rofi -location 2 -width 100 -dmenu -p locate: -l 20 -i -fn Hack-10"
p=$(echo ""| $DMENU)

if [ "$p" != "" ]
then
    #(2) call locate with p and create dmenu from results:
    #d=$(mlocate -A -i -b  -l 1000 $p | $DMENU)  #locate is limited to 1000 finds
    d=$(mlocate -A -i -l 1000 $p | $DMENU)  #locate is limited to 1000 finds
fi

#(3) execute command with chosen file/directory
if [ "$d" != "" ]
then
    # check if directory or file and get base-directory
    if [ -d "$d" ] ; then
        location="$d"
    elif [ -f "$d" ]; then
        location="$(echo "$(cd "$(dirname "$d")"; pwd)")"
    fi
    # open terminal
    gnome-terminal -e "bash -c \"cd \\\"$location\\\"; echo \\\"open: \\\"\\\"$d\\\"; exec bash\""
fi
