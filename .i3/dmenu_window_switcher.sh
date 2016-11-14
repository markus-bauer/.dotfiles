#!/bin/bash
# DESCRIPTION
# select windows for i3-wm with dmenu
#based on https://github.com/minos-org/minos-tools/blob/master/tools/dmenu-i3-window-jumper

DMENU="dmenu -p window: -l 20 -i -fn Hack-10"

# check if dmenu is installed
#if ! command -v "dmenu" >/dev/null 2>&1; then
    #printf "%s\\n" "install 'dmenu' to run this program" >&2
    #exit 1
#fi

TITLE="$(i3-msg -t get_tree | egrep -o "(class.:.[a-Z]+.|title.:.[()0123456789~. -/a-Z]+)" | \
sed 's/"//g;s/class://g;s/title://g' | while read -r line; read -r line2; do printf "%s\\n" " $line :: $line2"; done | sed '/i3bar for/d' | ${DMENU})"

if [ -z "${TITLE}" ]; then
    exit 1
else
    # Escape some characters to prevent i3 to interpret them as a pattern
    # "(" and ")" replace them with "\(" and "\)"
    TITLE="$(printf "%s\\n" "${TITLE}" | egrep -o "::.*" | sed 's/:: //g;s/\([()]\)/\\\1/g')"

    # Focus window
    i3-msg "[title=\"${TITLE}\"] focus"
fi
