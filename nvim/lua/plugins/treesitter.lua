return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
   require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc",  "markdown", "markdown_inline","css","html","bash","javascript","python" },
  sync_install = false,
  auto_install = true,
}
    end,
}
