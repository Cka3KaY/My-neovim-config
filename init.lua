require("config.lazy")

vim.opt.shiftwidth = 2 -- Set indentation width
vim.opt.softtabstop = 2 -- Make backspace behave properly
vim.opt.expandtab = true -- Use spaces instead of tabs
-- vim.opt.smartindent = true -- Auto-indents based on syntax
vim.opt.autoindent = true -- Maintains indentation from the previous line
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.termguicolors = true
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 3
vim.keymap.set("n", "<leader>js", ":!node %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>py", ":python3 %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[c", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true }) -- Horizontal split
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { noremap = true, silent = true }) -- Vertical split
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-d>", ":m '>+5<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-u>", ":m '<-5<CR>gv=gv", { noremap = true, silent = true })
--vim.keymap.set("n", "<leader>e", ":Ex<CR>", {})
vim.keymap.set("n", "<Leader>rh", ":vertical resize -2<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<Leader>rl", ":vertical resize +2<CR>", { desc = "Increase split width" })
vim.keymap.set("n", "<Leader>rj", ":resize -2<CR>", { desc = "Decrease split height" })
vim.keymap.set("n", "<Leader>rk", ":resize +2<CR>", { desc = "Increase split height" })
vim.keymap.set("i", "jj", "<Esc>")
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd.colorscheme("catppuccin-macchiato")
-- Put this in your init.lua
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", '"', '""<Left>')
vim.keymap.set("i", "`", "``<Left>")
