# termux-nvim-setup

a simple setup for neovim on termux with all the essential plugins and configs to make your terminal coding experience smooth

## features

- preconfigured neovim setup optimized for termux
- syntax highlighting for various programming languages
- auto completion
- file explorer
- git integration
- beautiful color schemes
- fuzzy finding
- custom keybindings for faster workflow

## requirements

- termux app from github or f-droid
- basic knowledge of terminal commands
- internet connection for downloading plugins

## installation

### clone the repo

```
git clone https://github.com/BayonetArch/termux-nvim-setup.git
```

### run the install script

```
cd termux-nvim-setup
chmod +x install.sh
./install.sh
```

the script will install all necessary dependencies and set up your neovim configuration

## configuration

you can customize your setup by editing the config files in `~/.config/nvim/`

- `init.lua` - main configuration file
- `lua/plugins.lua` - manage your plugins
- `lua/keymaps.lua` - customize keybindings

## usage

simply type `nvim` in your termux terminal to start neovim

## troubleshooting

if you encounter any issues during installation or usage, check the logs or open an issue on github

