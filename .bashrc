#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Custom BASH PROMPT
PS1='[\e[1;32m\u\e[0m@  at \@ \w]$ '

## Local bin path added
[ -r $HOME/.local/bin ] && PATH=$PATH:$HOME/.local/bin

## Bash alias file
[ -r $HOME/.config/shell ] && source $HOME/.config/shell/aliasrc

## inputrc source
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"

## bash completion
[ -f /etc/bash_completion ] && source /etc/bash_completion
