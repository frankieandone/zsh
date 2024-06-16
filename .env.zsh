#!/usr/bin/env zsh

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /usr/bin
    /usr/local/bin
    $HOME/.local/bin
    $path
)

fpath=($ZSH_DOTFILES/autoload $fpath)

autoload -Uz $ZSH_DOTFILES/autoload/*(:t)

[ ! -z 'cargo -v' ] && path+=("$HOME/.cargo/bin")

[ ! -z 'sdk -v' ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ ! -z 'vcpkg -v' ] && export VCPKG_ROOT="$HOME/.c/vcpkg" && path+=("$VCPKG_ROOT")

[ ! -z 'volta -v' ] && export VOLTA_HOME="$HOME/.volta" && path+=("$VOLTA_HOME/bin")

[ ! -z 'docker -v' ] && path+=("$HOME/.docker/bin")

[ ! -z 'kubectl version' ] && source <(kubectl completion zsh | sed 's/kubectl/k/g')

export STARSHIP_CONFIG="$ZSH_DOTFILES/theme/starship/starship.toml"
export STARSHIP_CACHE="$ZSH_DOTFILES/theme/starship/.cache"

export XDG_CONFIG_HOME="$DOTFILES/app"

source "$ZSH_DOTFILES/private/.private"

typeset -U PATH path

