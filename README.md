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
- termux app.
*Link:(https://github.com/termux/termux-app/releases/)*  
- termx:api 
*Link: (https://github.com/termux/termux-api/releases)*
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
- `lua/keybinds.lua` - customize keybindings

## usage

> [!CAUTION]
> *after installing and opening the nvim you might get some erros wait till all plugins and treesitter is compiled and just restart termux*




## troubleshooting

if you encounter any issues during installation or usage, check the logs or open an issue on github

> [!NOTE]
> *This is just a heads-up or helpful info.*

> [!TIP]
> *A smart shortcut or best practice.*

> [!IMPORTANT]
> *Pay attention — this affects core functionality.*

> [!WARNING]
> *Something might break or behave unexpectedly.*

> [!CAUTION]
> *This could mess things up if ignored.*
