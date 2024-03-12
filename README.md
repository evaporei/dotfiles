# dotfiles

Configuration files of some software I use.

## Making `neovim` work

1. Install [packer](https://github.com/wbthomason/packer.nvim);

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Install plugins;

```bash
nvim ~/.config/nvim/lua/stuff/packer.lua
:so
:PackerSync
```

Next time you open `nvim` it will install the lsps and treesitter.

I'm not sure you need the following steps [3]-[5].

3. Install `pip`;

```bash
sudo pacman -Sy python-pip
```

4. Install `neovim` `pip` package;

```bash
sudo pip install neovim
```

5. Install `pynvim` `pip` package.

```bash
sudo pip install pynvim
```

## fish

Dependencies:

- https://github.com/joshuarli/vape (`cargo install vape`)

## i3

Dependencies:

- i3lockmore
- xss-lock
- feh
- fcitx5 (japanese)
- gnome-screenshot

## 日本語 :jp:

- uncomment `ja_JP.utf8` from `/etc/locale.gen`, then ofc run `locale-gen`
- set locale: `sudo localectl set-locale LANG=ja_JP.utf8`
- just undo terminal because it looks terrible: `LANG=en_US.UTF-8 kitty`

You should be good to go now, happy hacking! :woman_technologist:
