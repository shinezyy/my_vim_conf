## Thanks for
vundle, my vim configuration can be synchronized between multiple devices.

This repository is migrated from pathogen to vundle, which is able to
install plugins automatically. **NOTE: Now vundle must be initiated first.**

## This REPO is for

these people:

- first, of course, myself
- new vimer, who does not have enough experience or time to collect some useful
plugins themselves.

## How to

Let $vimConf be where you store this repository, and git clone this repo to
$vimConf.Then link vim and vimrc to your home:

``` shell

mv ~/.vim ~/.vim_bak
mv ~/.vimrc ~/.vimrc_bak
cd ~
ln -s $vimConf/vim .vim
ln -s $vimConf/vimrc .vimrc
```

### Vundle

Initiate vundle

``` shell

cd ~/.vim/bundle/
git submodule update --init Vundle.vim
```
Now, you can use vundle to install vim plugins automatically....

### Plugins

Jedi was recommended for pythoner before. Now YCM is recommended.
Because it helps completion in not only coding, but also many other editing
stuff, although it's heavy...
**I do not recommend to install YCM with vundle, especially in China...**
Because of poor accessibility to github,
the download rate is usually lower than 200 KiB/s.
In consequence, automated installation might be failed, and a manual
installation tells you where you failed...
To avoid this, an git proxy or manual installation is suggested.

I'll show you how to install it manually:

``` shell

cd $vimConf
git submodule update --init vim/bundle/YouCompleteMe # clone YCM

cd vim/bundle/YouCompleteMe
git submodule update --init --recursive # clone dependent modules
```

Then go to
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
to find operations for your language. Because it really depends on your
linux distribution and language.

### Tmux

If you use tmux and use Ctrl+A for instruction escape.

```
cd $vimConf
git submodule update --init tmux
cd ~
mv ~/.tmux.conf ~/.tmux.conf_bak
ln -s $vimConf/tmux/.tmux.conf .
```

