#!/usr/bin/env zsh

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
    docker
    git
    git-auto-fetch
    gpg-agent
    gradle-completion #custom
    history
    httpie
    poetry #custom
    ssh-agent
    sdk
    starship
    sudo
    volta
    zsh-autocomplete #custom
    zsh-autosuggestions #custom
    zsh-completions #custom
)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# pipx install argcomplete if 'argcomplete not found'
# install autocomplete for pipx
eval "$(register-python-argcomplete pipx)"

