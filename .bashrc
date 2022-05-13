case $- in
    *i*) ;; # interactive
    *) return ;;
esac

# ------------------- local utilities --------------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------- environment variables -----------------------

export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export DESKTOP="$HOME"
export DOWNLOADS="$HOME/dl"
export MUSIC="$HOME/music"
export TEMPLATES="$HOME/temp"
export VIDEOS="$HOME/vids"
export PUBLIC="$HOME/pub"
export PICTURES="$HOME/pix"

# ------------------ home dir cleanup ----------------------------

export XAUTHORITY=/tmp/Xauthority
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export LESSHISTFILE="-"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

# ------------------ other program settings ----------------------

export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# ------------------- bash prompt ---------------------------------

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    red='\[\033[31m\]' black='\[\033[30m\]' blue='\[\033[34m\]' \
    yellow='\[\033[33m\]' purple='\[\033[35m\]' \
    cyan='\[\033[36m\]' r='\[\033[0m\]' dim='\[\033[2;37m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$purple:$r$red$B$r"

  prompt="$dim\W$r$B \$ "
PS1="$prompt"
}

PROMPT_COMMAND="__ps1"

# ------------------- aliases ------------------------------------

# comman aliaes
alias cl='clear'
##ls alias
alias ls='ls --group-directories-first --color=auto'
alias la='ls -a --group-directories-first --color=auto'
alias ll='ls -lAh --group-directories-first --color=auto'
##grep alias
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#vim and emacs
_have vim && alias vi=vim
_have nvim && alias nv="nvim"
# git alias
_have git && alias gs='git status'
_have git && alias ga='git add'
_have git && alias gc='git commit -m'
_have git && alias gp='git push origin main'
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# doas aliases
_have doas && alias doas='doas --'

# ------------------------------- history ---------------------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# ---------------------------- keyboard ---------------------------------------

_have setxkbmap && test -n "$DISPLAY" && \
    setxkbmap -option caps:escape &>/dev/null
_have xset && test -n "$DISPLAY" && \
    xset r rate 200 40
