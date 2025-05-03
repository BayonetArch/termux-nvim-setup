
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    -- Kanagawa-inspired colors
    local orange = "#fa9b61" -- close to Kanagawa's peach/sakura tone

    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = orange, bold = true })
    vim.api.nvim_set_hl(0, "DashboardIcon", { fg = orange })
    vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#c8c093" }) -- kanagawa's fawn
    vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#98bb6c", bold = true }) -- leaf green
    vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#7e9cd8" }) -- wave blue

    local header = {
      "",
      "██████╗  █████╗ ██╗   ██╗ ██████╗ ███╗   ██╗███████╗████████╗",
      "██╔══██╗██╔══██╗╚██╗ ██╔╝██╔═══██╗████╗  ██║██╔════╝╚══██╔══╝",
      "██████╔╝███████║ ╚████╔╝ ██║   ██║██╔██╗ ██║█████╗     ██║   ",
      "██╔══██╗██╔══██║  ╚██╔╝  ██║   ██║██║╚██╗██║██╔══╝     ██║   ",
      "██████╔╝██║  ██║   ██║   ╚██████╔╝██║ ╚████║███████╗   ██║   ",
      "╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝   ",
      "",
    }

    require("dashboard").setup({
      theme = "doom",
      config = {
        header = header,
        header_hl = "DashboardHeader",
        center = {
          {
            icon = "󰈞 ",
            icon_hl = "DashboardIcon",
            desc = "Find File                ",
            desc_hl = "DashboardDesc",
            key = "f",
            key_hl = "DashboardKey",
            action = "Telescope find_files",
          },
          {
            icon = "󰋚 ",
            icon_hl = "DashboardIcon",
            desc = "Recent Files             ",
            desc_hl = "DashboardDesc",
            key = "r",
            key_hl = "DashboardKey",
            action = "Telescope oldfiles",
          },
          {
            icon = "󰈭 ",
            icon_hl = "DashboardIcon",
            desc = "Find Word                ",
            desc_hl = "DashboardDesc",
            key = "g",
            key_hl = "DashboardKey",
            action = "Telescope live_grep",
          },
          {
            icon = "󱏒 ",
            icon_hl = "DashboardIcon",
            desc = "Config Files             ",
            desc_hl = "DashboardDesc",
            key = "c",
            key_hl = "DashboardKey",
            action = function()
              local api = require("nvim-tree.api")
              if api and api.tree then
                api.tree.toggle({
                  path = vim.fn.stdpath("config"),
                  focus = true,
                  find_file = true,
                  open_file = false,
                })
              else
                vim.notify("NvimTree API not available", vim.log.levels.WARN)
              end
            end,
          },
          {
            icon = " ",
            icon_hl = "DashboardIcon",
            desc = "New File                 ",
            desc_hl = "DashboardDesc",
            key = "n",
            key_hl = "DashboardKey",
            action = function()
              vim.cmd("enew")
            end,
          },
          {
            icon = "󰒲 ",
            icon_hl = "DashboardIcon",
            desc = "Lazy Plugin Manager      ",
            desc_hl = "DashboardDesc",
            key = "l",
            key_hl = "DashboardKey",
            action = "Lazy",
          },
          {
            icon = "󰗼 ",
            icon_hl = "DashboardIcon",
            desc = "Quit                     ",
            desc_hl = "DashboardDesc",
            key = "q",
            key_hl = "DashboardKey",
            action = "qa",
          },
        },
        footer = function()
          local stats_ok, lazy = pcall(require, "lazy")
          local count, time = "N/A", "N/A"
          if stats_ok and lazy.stats then
            local s = lazy.stats()
            count = s.count
            time = (math.floor(s.startuptime * 100 + 0.5) / 100) .. "ms"
          end
          local v = vim.version()
          return {
            "",
            "  󱐋 " .. count .. " plugins 󰅐 " .. time,
            "  Neovim " .. v.major .. "." .. v.minor .. "." .. v.patch,
          }
        end,
        footer_hl = "DashboardFooter",
      },
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
    })
  end,
}
