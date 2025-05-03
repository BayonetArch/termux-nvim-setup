-- ~/.config/nvim/lua/plugins/colorizer.lua
return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    user_default_options = {
      names = true, -- enable color names like "red"
      css = true,
      css_fn = true,
      mode = "background", -- or "virtualtext" or "foreground"
    },
  },
  event = "BufReadPre",
}
