#!/usr/bin/env zsh

if command -v nvim &>/dev/null; then
    EDITOR=nvim
    alias vim=nvim
fi

if command fleet -V &>/dev/null; then
    alias dotconfig='fleet "$DOTFILES"'
elif command code -v &>/dev/null; then
    alias dotconfig='code -n "$DOTFILES"'
elif command nvim -v &>/dev/null; then
    alias dotconfig='nvim "$DOTFILES"'
fi

if command tldr -v &>/dev/null; then
  alias man='tldr'
  alias def='tldr'
fi
