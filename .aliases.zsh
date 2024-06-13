#!/usr/bin/env zsh

if command -v nvim &>/dev/null; then
    EDITOR=nvim
    alias vim=nvim
fi

if command fleet -V &>/dev/null; then
    alias dotconfig='fleet "$DOTFILES"'
elif command code -v &>/dev/null; then
    alias dotconfig='code -n "$DOTFILES"'
fi

if [ -f /Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea ]; then
    alias idea='/Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea'
fi
