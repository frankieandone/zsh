umask 077

DOTFILES=$HOME/.dotfiles
ZSH_DOTFILES=$HOME/.dotfiles/zsh

source $ZSH_DOTFILES/.env.zsh

[ -f "$HOME/.env" ] \
    && source "$HOME/.env"

