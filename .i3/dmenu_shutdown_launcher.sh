#!/bin/bash

# DESCRIPTION
# simple dmenu that allows quick-acces to poweroff, reboot and sleep.

DMENU="dmenu -p launch: -l 20  -fn Hack-10"

TITLE="$(printf "(SLEEP) pm-suspend\n(RB) reboot\n(OFF) poweroff" | ${DMENU})"

# Focus window
if [ "$TITLE" == "(OFF) poweroff" ]; then
    gnome-terminal -e "bash -c poweroff;bash"
elif [ "$TITLE" == "(SLEEP) pm-suspend" ]; then
    gnome-terminal -e "sudo pm-suspend;i3lock"
elif [ "$TITLE" == "(RB) reboot" ]; then
    gnome-terminal -e "bash -c reboot;bash"
fi
