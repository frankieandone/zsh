#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles
ZSH_DOTFILES=$HOME/.dotfiles/zsh

source $ZSH_DOTFILES/.interactive.zsh
source $ZSH_DOTFILES/.aliases.zsh

# preserves shell history, shell vars, knowledge of background jobs
hot_reload_shell() {
    source $HOME/.zshrc
}

rl() {
    hot_reload_shell
}
