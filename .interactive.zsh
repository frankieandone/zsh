#!/usr/bin/env zsh

export TERM=xterm-256color
export XDG_CONFIG_HOME="$DOTFILES/app"
export STARSHIP_CONFIG="$ZSH_DOTFILES/theme/starship/starship.toml"
export STARSHIP_CACHE="$ZSH_DOTFILES/theme/starship/.cache"

DISABLE_MAGIC_FUNCTIONS=true
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

zstyle ':omz:plugins:*' aliases no
zstyle ':omz:plugins:git' aliases yes
zstyle ':omz:update' mode disabled
zstyle ':omz:update' verbose

autoload -Uz compinit && compinit -C
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
PS1='%~ $vcs_info_msg_0_'
setopt prompt_subst

plugins=(
    copyfile
    docker
    git
    git-auto-fetch
    gpg-agent
    gradle-completion #custom
    history
    httpie
    kubectl #custom
    poetry #custom
    ssh-agent
    sdk
    starship
    sudo
    volta
    you-should-use
    zsh-autocomplete #custom
    zsh-autosuggestions #custom
    zsh-completions #custom
    zsh-syntax-highlighting
)
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source "$ZSH_DOTFILES/private/.private"

# pipx install argcomplete if 'argcomplete not found'
# install autocomplete for pipx
eval "$(register-python-argcomplete pipx)"

