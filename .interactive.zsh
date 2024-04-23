#!/usr/bin/env zsh

DISABLE_MAGIC_FUNCTIONS=true
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

zstyle ':omz:plugins:*' aliases no
zstyle ':omz:plugins:git' aliases yes
zstyle ':omz:update' mode disabled
zstyle ':omz:update' verbose silent

autoload -Uz compinit && compinit -C
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
PS1='%~ $vcs_info_msg_0_'
setopt prompt_subst

plugins=(sudo gpg-agent ssh-agent history git git-auto-fetch zsh-autocomplete)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" >/dev/null 2>&1
eval "$(pyenv virtualenv-init -)" >/dev/null 2>&1

eval "$(starship init zsh)"

