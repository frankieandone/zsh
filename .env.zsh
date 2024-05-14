#!/usr/bin/env zsh

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /usr/bin
    /usr/local/bin
    $path
)

fpath=($ZSH_DOTFILES/autoload $fpath)

autoload -Uz $ZSH_DOTFILES/autoload/*(:t)

local SDKMAN_HOME="$HOME/.sdkman/bin/sdkman-init.sh"
if [ -f $SDKMAN_HOME ]; then
    source "$SDKMAN_HOME"
    unset SDKMAN_HOME
fi

if ! echo "$PATH" | grep -q "$HOME/.cargo/bin"; then
    path=($HOME/.cargo/bin $path)
fi

if [ -d "$HOME/Library/Android/sdk" ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    path=(
        $path
        $ANDROID_HOME
        $ANDROID_HOME/platform-tools
        $ANDROID_HOME/build-tools/34.0.0
        $ANDROID_HOME/tools
    )
fi

if [ -d $HOME/.c ]; then
    export VCPKG_ROOT=$HOME/.c/vcpkg
    path+=($VCPKG_ROOT)
fi

export VOLTA_HOME=$HOME/.volta
path=($VOLTA_HOME/bin $path)

export STARSHIP_CONFIG=$ZSH_DOTFILES/theme/starship/starship.toml
export STARSHIP_CACHE=$ZSH_DOTFILES/theme/starship/.cache

export XDG_CONFIG_HOME=$DOTFILES/app

typeset -U PATH path

export PATH
