## Thanks for
pathogen, my vim configuration can be synchronized between multiple devices.
Because of my laziness, pathogen, vim-latex, and vim-verilog is not
organized with git submodules.

## This REPO is for

these people:

- first, of course, myself
- new vimer, who does not have enough experience or time to collect some useful
plugins themselves.

## How to

git clone this repo to $vimConf.

Then

``` shell
mv ~/.vim ~/.vim_bak
mv ~/.vimrc ~/.vimrc_bak
cd ~
ln -s $vimConf/.vim .
ln -s $vimConf/.vimrc .

cd ~/.vim/bundle/
git submodule update --init badwolf
```

If you are scalar (color scheme only):

```
cd ~/.vim/bundle/
git submodule update --init vim-scala
```

If you are pythoner:

```
cd ~/.vim/bundle/
git submodule update --init jedi-vim
sudo -H pip install jedi
```

If you use tmux and use Ctrl+A for instruction escape.

```
cd $vimConf
git submodule update --init tmux
cd ~
mv ~/.tmux.conf ~/.tmux.conf_bak
ln -s $vimConf/tmux/.tmux.conf .
```

If you are CPPer: go to [YouCompleteMe](https://github.com/Valloric/YouCompleteMe),
and **learn** how to install and configure it.
If your vim does not support python, YCM's Full installation guide will tell you.
Considering that large CPP projects might not effect vim's performance,
I do not suggest to use it for heavy projects.

