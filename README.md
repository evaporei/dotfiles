# dotfiles

Configuration files of some software I use.

## Making `neovim` work on arch

**1. Install [vim-plug](https://github.com/junegunn/vim-plug);**

```shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

**2. Install `neovim` plugins;**
```shell
nvim
:PlugInstall
```

**3. Install `pip`;**

```shell
sudo pacman -Sy python-pip
```

**4. Install `neovim` `pip` package;**

```shell
sudo pip install neovim
```

**5. Install `pynvim` `pip` package;**

```shell
sudo pip install pynvim
```

**6. Open `neovim` and update the remote plugins;**

```shell
nvim
:UpdateRemotePlugins
```

You should be good to go now, happy hacking! :woman_technologist:
