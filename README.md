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

cd $vimConf
git submodule update --init vim/bundle/Vundle.vim
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

Here are some tips:

- You'd better install/compile vim8 with python support.
For ubuntu 14, there are some PPAs providing vim8 binary;
For centos, I compiled it...
- For CPPer, packages like cmake and python-dev must be installed;
- **Very Important:** If your vim support python2,
execute install.py with python2; The same to python3.
- If you are not CPPer, don't add "--clang-completer" option to save time.


After installation of YCM, installing other plugins should be much easier.
Enter vim, switch to command mode and use *:PluginInstall* to install others.

### Tmux

If you use tmux and use Ctrl+A for instruction escape.

```
cd $vimConf
git submodule update --init tmux
cd ~
mv ~/.tmux.conf ~/.tmux.conf_bak
ln -s $vimConf/tmux/.tmux.conf .
```

