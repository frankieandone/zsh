#!/usr/bin/env zsh

setup_editor() {
    export EDITOR='vi'

    if command fleet -V &>/dev/null; then
        EDITOR='fleet'
    elif command code -v &>/dev/null; then
        EDITOR='code -n'
    elif command nvim -v &>/dev/null; then
        alias vim='nvim'
        EDITOR='nvim'
    fi
}

setup_conf_aliases() {
    alias dotconfig='cd ${DOTFILES} && ${EDITOR} .'
    alias zshconfig='cd ${DOTFILES}/zsh && ${EDITOR} .'
    alias omzconfig='cd ${HOME}/.oh-my-zsh && ${EDITOR} .'
}

if command tldr -v &>/dev/null; then
  alias man='tldr'
  alias def='tldr'
fi

setup_editor && setup_conf_aliases

command kubectl version &>/dev/null && alias k='kubectl';

