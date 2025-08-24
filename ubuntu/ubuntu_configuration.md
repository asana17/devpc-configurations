# ubuntu configuration

## apps
1. zsh (apt)
1. git
1. neovim (from GitHub)
1. fzf
1. trash-cli (apt)
1. fd
1. batcat
1. ripgrep


### extra
1. tzdata
1. build-essential
1. clang
1. python3-venv
1. python3-pip
1. ctags

### for GUI
1. Google Chrome
1. tilix (apt)
1. nemo

## terminal
### tilix
#### tilix settings
- Appearance
  - Window style : disable CSD
  - Terminal title style : none
  - Theme variant : dark
  - Check 'use a wide handle for splitters'
  - remove check 'show the terminal title even if it's the only terminal'
- Quake
  - Height percent : 90
  - change height percent to 100% `gsettings set com.gexperts.Tilix.Settings quake-height-percent 100`

- Profiles
  - Command: run as a login shell
          run a custom command 'zsh'
  - Color: scheme 'Monokai Dark'
          add transparency

#### others

- add custom keyboard shortcuts to ubuntu
- add extra space to terminal : edit `~/.config/gtk-3.0/gtk.css`

    ```
    VteTerminal,
    TerminalScreen,
    vte-terminal {
      padding: 30px 30px 40px 40px;
      -VteTerminal-inner-border: 20px 20px 20px 20px;
    }
    ```

### zsh
#### install

- run `$chsh -s $(which zsh)` and change login shell to zsh

#### settings

- Download `.zshrc` from this repo
- install `zplug` from GitHub

### neovim
#### install
- get stable from github (tar.gz)
- mv nvim to `/usr/`
- `sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim`
- copy lua nvim configs (not using init.vim and dein.toml)
- download `nerd-fonts` from GitHub
- `sudo apt install xsel xclip`
- `git config --global core.editor vim`

#### lsp

- you need `g++-12` for LSP in ubuntu22.04
- `rustup +nightly component add rust-analyzer-preview` then `rustup show` and add rust-analyzer to path

#### tagbar

1. You need to install ctags [description](https://docs.ctags.io/en/latest/autotools.html#gnu-linux-distributions)
2. copy .ctags from this repo

### nemo
#### setting

```
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
```

### bat

```
sudo apt install bat
ln -s /usr/bin/batcat ~/.local/bin/bat
```

## UI
1. gnome shell extensions
  dash to panel
2. Gnome tweaks
  change font to Mplus1
  change monospace font to Cica

## time

fix misalignment of windows time when dualboot
`timedatectl set-local-rtc 1`


## i3

```
sudo apt install i3
```

select i3 as a window manager in login screen

```
sudo apt install i3lock
```

`i3lock` to lock screen, input password to unlock

### transparency

```
sudo apt install picom
```

### display layout

```
sudo apt install arandr
```


save the display layout after confgurating in GUI

```
arandr
```

### wall paper

```
sudo apt install feh
```

set background by

```
feh -Zr ~/Pictures
```

### screen capture

```
sudo apt install scrot
```

## fcitx

```
sudo apt install fcitx fcitx-mozc
```

```
echo "export DEFAULT_INPUT_METHOD=fcitx" >> ~/.profile
echo "export GTK_IM_MODULE=fcitx" >> ~/.profile
echo "export QT_IM_MODULE=fcitx" >> ~/.profile
echo "export XMODIFIERS=@im=fcitx" >> ~/.profile
```

and then run

```
fcitx-config-gtk3
```

to add mozc to input method

## sound

```
sudo apt install pavucontrol
pavucontrol
```
