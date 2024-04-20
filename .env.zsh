#!/usr/bin/env zsh

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /usr/bin
    /usr/local/bin
    "${path[@]}"
)

fpath=($ZSH_DOTFILES/autoload $fpath)

autoload -Uz $ZSH_DOTFILES/autoload/*(:t)

local SDKMAN_HOME="$HOME/.sdkman/bin/sdkman-init.sh"
if [ -f $SDKMAN_HOME ]; then
    source "$SDKMAN_HOME"
    unset SDKMAN_HOME
fi

if ! echo "$PATH" | grep -q '/opt/homebrew/bin'; then
    path+=(/opt/homebrew/bin)
fi

if ! echo "$PATH" | grep -q "$HOME/.cargo/bin"; then
    path+=($HOME/.cargo/bin)
fi

if [ -d "$HOME/Library/Android/sdk" ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    path=(
        "${path[@]}"
        $ANDROID_HOME
        $ANDROID_HOME/platform-tools
        $ANDROID_HOME/build-tools/34.0.0
        $ANDROID_HOME/tools
    )
fi

if [ -d "/opt/homebrew/opt/postgresql@16" ]; then
    export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
    path+=(/opt/homebrew/opt/postgresql@16/bin)
fi

if [ -d $HOME/.c ]; then
    export VCPKG_ROOT=$HOME/.c/vcpkg
    path+=($VCPKG_ROOT)
fi

export STARSHIP_CONFIG=$ZSH_DOTFILES/theme/starship/starship.toml
export STARSHIP_CACHE=$ZSH_DOTFILES/theme/starship/.cache

typeset -U PATH path

export PATH
