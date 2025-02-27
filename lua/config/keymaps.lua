vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[c", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true }) -- Horizontal split
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { noremap = true, silent = true }) -- Vertical split
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
