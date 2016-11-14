#!/bin/bash

# DESCRIPTION
# Run custom commands or launch programs from dmenu.
# I use it as a quick launcher for i3-window manager. It works, but is not very robust.

# TODO: cleanup after switche from dmenu to rofi

terminal=gnome-terminal

#--- dmenu
#-- call dmenu with custom prompt (-p) and font (-f) as a list with 20 items (-l 20)
# DMENU="dmenu -p start: -l 20  -fn Hack-10"

#-- rofi
DMENU="rofi -location 2 -width 100 -dmenu -p start: -l 20  -fn Hack-10"

# Content of the menu
TITLE="$(printf "W firefox\nWW xombrero\nEM thunderbird\nR ranger\nE nautilus\nP gpodder\nM cmus\nMM audacious\nV gvim\nY mpv youtube\nC gsimplecal" | ${DMENU})"

if [ "$TITLE" == "W firefox" ]; then
    firefox
elif [ "$TITLE" == "WW xombrero" ]; then
    xombrero
elif [ "$TITLE" == "M cmus" ]; then
    $terminal -e "bash -c cmus;exec bash"
elif [ "$TITLE" == "MM audacious" ]; then
    auacious
elif [ "$TITLE" == "E nautilus" ]; then
    nautilus --no-desktop
elif [ "$TITLE" == "V gvim" ]; then
    gvim 
elif [ "$TITLE" == "P gpodder" ]; then
    gpodder
elif [ "$TITLE" == "R ranger" ]; then
    RANGER='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
    $terminal -e "bash -c \"$RANGER; exec bash\""
elif [ "$TITLE" == "Y mpv youtube" ]; then
    $terminal -e "bash $HOME/scripts/mpv_youtube.sh"
elif [ "$TITLE" == "C gsimplecal" ]; then
    gsimplecal
elif [ "$TITLE" == "EM thunderbird" ]; then
    thunderbird
fi
