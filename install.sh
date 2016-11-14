#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#----common files-----
ln -i -s -v  -T "$dir/.i3"  "$HOME/.i3"
ln -i -s -v  "$dir/.vimrc" "$home/.vimrc"
ln -i -s -v  "$dir/.bashrc" "$home/.bashrc"
ln -i -s -v  "$dir/.newsbeuter/config"  "$home/.newsbeuter/config"
ln -i -s -v  "$dir/.config/redshift.conf"  "$home/.config/redshift.conf"
ln -i -s -v  "$dir/.config/mpv/input.conf"  "$home/.config/mpv/input.conf" 
ln -i -s -v  "$dir/.config/mpv/mpv.conf"  "$home/.config/mpv/mpv.conf" 
ln -i -s -v  "$dir/.config/ranger/rc.conf"  "$home/.config/ranger/rc.conf" 
ln -i -s -v  "$dir/.config/ranger/rifle.conf"  "$home/.config/ranger/rifle.conf" 
ln -i -s -v  "$dir/.config/ranger/scope.sh"  "$home/.config/ranger/scope.sh" 
ln -i -s -v  "$dir/.conkyrc"  "$HOME/.conkyrc"
ln -i -s -v  "$dir/.Xresources"  "$HOME/.Xresources"
