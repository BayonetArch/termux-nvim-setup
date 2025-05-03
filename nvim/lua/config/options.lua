vim.g.mapleader = " "
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 250
vim.cmd([[
  se tabstop=4
  se shiftwidth=4
  se expandtab
  se smartindent
  se autoindent
  se nu
  tnoremap <Esc> <C-\><C-n>
]])
