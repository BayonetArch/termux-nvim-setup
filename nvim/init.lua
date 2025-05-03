require("config.lazy")
require("config.keybinds")
require("config.options")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        vim.schedule(function()
            local path = vim.fn.expand("%:.")
            local icon = ""
            local msg = string.format(" %s  file written: ./%s", icon, path)
            vim.api.nvim_echo({{msg, "Directory"}}, false, {})
        end)
    end,
})
vim.keymap.set("n","<leader>tt",function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0,5)
end
)
--highlight when yanking 

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 180 })
    end,
})

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#FF4500" }) 

vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})
vim.cmd([[  
    hi NvimTreeWinSeparator guifg=orange guibg=NONE gui=bold  
]])
vim.opt.shortmess:append("c")
vim.opt.shortmess:append("I") 
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line([['"]])
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})
