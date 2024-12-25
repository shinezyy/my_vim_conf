# Setup NEOVIM and tmux quickly

Now I migrate to neovim for asynchronous support (although it is support in vim now) and extensibility:
I use lazy.nvim to manage plugins.

## Install neovim

Go to [latest stable release](https://github.com/neovim/neovim/releases/latest),
download `nvim.appimage` with browser, wget, or anything you like.
``` shell
# Linux:
chmod u+x nvim.appimage
nvim.appimage --appimage-extract
mkdir -p ~/.local/bin
mv squashfs-root ~/.local/bin/neovim  # assume that ~/.local/bin is in $PATH
echo "export PATH=$HOME/.local/neovim:$PATH" >> ~/.zshrc
```


## Plugins

``` shell
git clone https://github.com/shinezyy/my_vim_conf.git ~/projects/my_vim_conf
mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins
echo 'require("config.lazy")' > ~/.config/nvim/init.lua

cd ~/.config/nvim
ln -sf ~/projects/my_vim_conf/neovim/lazy-lock.json .
ln -sf ~/projects/my_vim_conf/neovim/lazy.lua ./lua/config/lazy.lua
ln -sf ~/projects/my_vim_conf/neovim/colorscheme.lua ./lua/plugins/colorscheme.lua

```

### install node for copilot

https://nodejs.org/en/download/package-manager


# Tmux

If you use tmux and use Ctrl+A for instruction escape.

```
cd $vimConf
git submodule update --init tmux
cd ~
mv ~/.tmux.conf ~/.tmux.conf_bak
ln -s $vimConf/tmux/.tmux.conf .
```
