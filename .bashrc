# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


pc1="\[$(tput setaf 043)\]"
pc2="\[$(tput setaf 043)\]"
pc3="\[$(tput setaf 178)\]"
pc4="\[$(tput setaf 168)\]"
pc5="\[$(tput setaf 15)\]"
pbold="\[$(tput bold)\]"
preset="\[$(tput sgr0)\]"

if [ "$color_prompt" = yes ]; then
    PS1="${pbold}${pc1}\u${preset} @ ${pbold}${pc2}\H[\l]${preset}: ${pbold}${pc3}\w\n${pbold}${pc4}\$${preset}${pc5} "
else
   PS1="\u @ \H[\l]: \w\n\\$\[$(tput sgr0)\] "
fi
unset color_prompt force_color_prompt

#If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #;;
#*)
    #;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# vi mode
set -o vi 
set show-mode-in-prompt on

## powerline
#if [ -f `which powerline-daemon` ]; then
  #powerline-daemon -q
  #POWERLINE_BASH_CONTINUATION=1
  #POWERLINE_BASH_SELECT=1
  #. /usr/share/powerline/bindings/bash/powerline.sh
#fi

# aliases conda
alias conda='/home/markus/anaconda3/bin/conda'
alias conda_notebook='/home/markus/anaconda3/bin/jupyter-notebook'
alias conda_jupyter='/home/markus/anaconda3/bin/jupyter'
alias conda_python='/home/markus/anaconda3/bin/python'
alias conda_ipython='/home/markus/anaconda3/bin/ipython'
alias conda_pip='/home/markus/anaconda3/bin/pip'
alias activate_py2='source /home/markus/anaconda3/bin/activate py2'
# aliases conda py2
alias conda2='/home/markus/anaconda3/envs/py2/bin/conda'
alias conda2_notebook='/home/markus/anaconda3/envs/py2/bin/jupyter-notebook'
alias conda2_jupyter='/home/markus/anaconda3/envs/py2/bin/jupyter'
alias conda2_python='/home/markus/anaconda3/envs/py2/bin/python'
alias conda2_ipython='/home/markus/anaconda3/envs/py2/bin/ipython'
alias conda2_pip='/home/markus/anaconda3/envs/py2/bin/pip'
# aliases
RANGER_LOAD_DEFAULT_RC=FALSE; export RANGER_LOAD_DEFAULT_RC
alias rr='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias news='newsbeuter -u ~/Dropbox/Config_files/newsbeuter/urls'

PATH=$PATH:'/home/markus/scripts/'
export PATH 

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
