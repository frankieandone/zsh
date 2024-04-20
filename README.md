# zsh

> [!NOTE]
> Use [post-commit](./../.git/modules/zsh/hooks/post-commit) (git hook)
> to automatically overwrite symlinks for zsh to work. Example given
> below:

```
POST_COMMIT_PATH=$HOME/.dotfiles/.git/modules/zsh/hooks/post-commit

touch $POST_COMMIT_PATH

echo '#!/usr/bin/env zsh
overwrite_user_zsh_files() {
    ln -sfv $ZSH_DOTFILES/.proto.zshenv.zsh $HOME/.zshenv
    ln -sfv $ZSH_DOTFILES/.proto.zshrc.zsh $HOME/.zshrc
}
overwrite_user_zsh_files' >$POST_COMMIT_PATH

chmod +x $POST_COMMIT_PATH

unset POST_COMMIT_PATH
```
