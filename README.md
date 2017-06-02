## Thanks for
pathogen, my vim configuration can be synced betweent multiple devices.
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
ln -s $vimConf/.vim ./
ln -s $vimConf/.vimrc ./

cd ~/.vim/bundle/
git submodule update --init badwolf
```

If you are scalar:

```
git submodule update --init vim-scala
```

If you are pythoner:

```
git submodule update --init jedi-vim
sudo -H pip install jedi
```

If you are Cpper: go to YCM's repo, and **learn** how to
install it.

If your vim does not support python, YCM's repo told you.
