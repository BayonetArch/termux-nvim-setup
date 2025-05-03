return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "EdenEast/nightfox.nvim" },
  config = function()
    local colors = require("nightfox.palette").load("nightfox")

    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = colors.bg1, bg = colors.blue.base, gui = "bold" },
            b = { fg = colors.fg1, bg = colors.bg3 },
            c = { fg = colors.fg2, bg = colors.bg1 },
          },
          insert = {
            a = { fg = colors.bg1, bg = colors.green.base, gui = "bold" },
          },
          visual = {
            a = { fg = colors.bg1, bg = colors.magenta.base, gui = "bold" },
          },
          replace = {
            a = { fg = colors.bg1, bg = colors.red.base, gui = "bold" },
          },
          command = {
            a = { fg = colors.bg1, bg = colors.yellow.base, gui = "bold" },
          },
          inactive = {
            a = { fg = colors.fg3, bg = colors.bg1, gui = "bold" },
            b = { fg = colors.fg3, bg = colors.bg1 },
            c = { fg = colors.fg3, bg = colors.bg1 },
          },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { "alpha", "dashboard" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } }
        },
        lualine_b = {
          { "branch", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          {
            "diff",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
            symbols = { added = "+", modified = "~", removed = "-" },
          },
          {
            "diagnostics",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = " ●" } }
        },
        lualine_x = {
          { "filetype", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          { "encoding", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          { "fileformat", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
        lualine_y = {
          { "progress", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } }
        },
        lualine_z = {
          { "location", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } }
        },
      },
      inactive_sections = {
        lualine_a = { { "filename", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
