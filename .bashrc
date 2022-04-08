#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Custom BASH PROMPT
PS1='[\e[1;32m\u\e[0m@  at \@ \w]$ '

## Local bin path added
if [ -r $HOME/.local/bin/ ]; then
	PATH=$PATH:$HOME/.local/bin
fi

## Bash alias file
if [ -r $HOME/.config/shell ]; then
    source $HOME/.config/shell/aliasrc
fi

## inputrc source
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"

## bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi
