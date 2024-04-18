#!/usr/bin/env zsh

ZSH_DOTFILES=$HOME/.dotfiles

umask 077

if [ -z $DOTFILES_ENV_LOADED ]; then
    source $ZSH_DOTFILES/.env.zsh

    if [ -f $HOME/.env ]; then
        source $HOME/.env
    fi

    export DOTFILES_ENV_LOADED=1
fi
