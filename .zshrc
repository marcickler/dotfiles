# This file is tracked by git, but programs like conda can modify it.
# You need to move these changes to ~.zshrc_local if you don't want the repo to be dirty.

[ -f ~/.shell_env ] && source ~/.shell_env

# Skip prompt/plugins for non-interactive invocations (agents, scripts).
[[ -o interactive ]] || return 0
# Skip prompt/plugins when no TTY is attached (e.g. zsh -ic in automation).
[[ -t 0 && -t 1 ]] || return 0

# source local zsh configuration if it exists
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

# source the global .zshrc
source ~/.zshrc_global

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
