# This file is tracked by git, but programs like conda can modify it.
# You need to move these changes to ~.zshrc_local if you don't want the repo to be dirty.

# source the tracked .zshrc
source ~/.zshrc_tracked

# source local zsh configuration if it exists
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

