#!/usr/bin/env zsh

DISABLE_MAGIC_FUNCTIONS=true
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

zstyle ':omz:plugins:*' aliases no
zstyle ':omz:plugins:git' aliases yes
zstyle ':omz:update' mode disabled
zstyle ':omz:update' verbose silent

autoload -Uz compinit && compinit -C

# ZSH_THEME=robbyrussell
ZSH_THEME=daivasmara
plugins=(gpg-agent ssh-agent history git)
source $HOME/.oh-my-zsh/oh-my-zsh.sh
