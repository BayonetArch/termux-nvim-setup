local keymap = vim.keymap.set
local builtin = require("telescope.builtin")
vim.g.mapleader = " "
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 250
--life changing bindings
keymap("n", "xx", '"_dd', { noremap = true })
keymap("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })
keymap("n", "<C-h>", "<C-w>h", { noremap = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true })
keymap("n", "<C-J>", "<C-w>w", { noremap = true })
keymap("n", "<C-e>", ":qa!<CR>", { noremap = true })
-- Insert/Visual/Normal mode shared keymaps
keymap({"i", "v", "x", "n"}, "<C-c>", "<Esc>:")
keymap({"i", "v", "x", "n"}, "<C-n>", "<Esc>")
keymap({"i", "v", "n"}, "<C-s>", "<Esc>:w<CR>")
--INDENTING IDK IM JUST TRYING .. local keymap = keymap
keymap({"n","v"}, "<leader>f", "gg=G``", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })
keymap("v", "<", "<gv", { noremap = true, silent = true })
--improved new line ...

keymap("n", "o", "m`o<Esc>``", { noremap = true })
keymap("n", "O", "m`O<Esc>``", { noremap = true })
keymap("n",  "<leader>e",":NvimTreeToggle<CR>", { noremap = true })
--keymaps for telescope

keymap("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true })
keymap("n", "<leader>ff", builtin.oldfiles, { noremap = true, silent = true })

--use xclip for copying and pasting type shii...
keymap("v", "tt", ":w !xclip -selection clipboard<CR>", { noremap = true, silent = true, desc = "Copy to clipboard (xclip)" })
keymap("n", "tp", ":r !xclip -selection clipboard -o<CR>", { noremap = true, silent = true, desc = "Paste from clipboard (xclip)" })
--termux-clipboard-BINDINGS
keymap({"n","v","t"}, "tc", ":w !termux-clipboard-set<CR>", { noremap = true, silent = true, desc = "Copy to Termux clipboard" })
keymap({"n","v","t"}, "tv", ":r !termux-clipboard-get<CR>", { noremap = true, silent = true, desc = "Paste from Termux clipboard" })
---FZF LUA BINDINGS BABY 
keymap("n","<C-f>",":FzfLua files cwd=~/ <CR>")
--FUCNTION FOR TERMINAL
vim.keymap.set("n","<leader>tt",function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0,5)
end
)

keymap("n", "<leader>bb", ":bn<CR>", { noremap = true })
