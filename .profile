# Set SHELL to zsh if available
if [ -x /bin/zsh ]; then
    export SHELL=/bin/zsh
elif [ -x ~/bin/zsh ]; then
    export SHELL=~/bin/zsh
fi

# Start zsh if not already running
[ -z "$ZSH_VERSION" ] && [ -x "$SHELL" ] && exec "$SHELL" -l

