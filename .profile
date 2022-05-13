# Dead brain program
if [ -n "$BASH_PROFILE" ]; then
    [ -f $HOME/.bashrc ] && . $HOME/.bashrc
fi

if [ -z "$DISPLAY" ]; then
  pidof -s Xorg >/dev/null 2>&1 || exec startx "$XINITRC"
fi
