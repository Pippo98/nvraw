# Nvim prerequisite
I am using nvim nightly builds (aka prerelease). This config uses some nvim features that are available only in new versions.
[link to github releases](https://github.com/neovim/neovim/releases/nightly)

# Setup
clone directly in .config folder
```bash
git clone <this-repo-url> ~/.config
```
By default nvim searches for `~/.config/nvim` folder. You can either clone this repo with that folder name, or you could instead manage **multiple different nvim configurations**.
To make nvim use this config, you can run this command:
```bash
NVIM_APPNAME="nvraw" nvim
```

In my .bashrc I add this alias:
```bash
alias nr='NVIM_APPNAME="nvraw" nvim'
```

So now I can have multiple nvim configs each in a different folder.


# Font
To enable all the icons to show properly you should use [Nerd Fonts](https://www.nerdfonts.com/). These includes FontAwesome/Material etcc icons.

I use RobotoMono. [Here is the link to the zip](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.zip).
