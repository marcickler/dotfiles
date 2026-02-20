# Dotfiles configurations

This repository contains dotfiles to use zsh as shell, tmux as terminal
multiplexer, and fzf as command-line fuzzy finder among several
smaller configurations.

## Setup

Check out the dotfiles repository in existing home directory and update the
submodules:

```bash
    cd && git init -b main
    git remote add origin https://github.com/marcickler/dotfiles.git
    git fetch origin && git checkout -t origin/main
    git submodule update --init
    touch ~/.zshrc_local
    touch ~/.shell_env
    line='[ -f "$HOME/.shell_functions" ] && . "$HOME/.shell_functions"'
    grep -qxF "$line" ~/.shell_env || printf '%s\n' "$line" >> ~/.shell_env
    ~/.fzf/install --key-bindings --completion --no-update-rc --no-bash
```

## Local configs

Configurations that are specific to a machine such as environment variables
can be placed in `~/.shell_env` (for shared env vars) and `~/.zshrc_local`
(for interactive zsh-only settings like aliases/functions). These files are
sourced from `~/.zshrc` if they exist.
