require("config.lazy")

-- Telescope keybindings
require("mini.indentscope").setup({})
require("render-markdown").enable()
require("Comment").setup()
require("mini.surround").setup()
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
vim.opt.shiftwidth = 2 -- Set indentation width
vim.opt.softtabstop = 2 -- Make backspace behave properly
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Auto-indents based on syntax
vim.opt.autoindent = true -- Maintains indentation from the previous line
vim.keymap.set("n", "<leader>js", ":!node %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[c", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true }) -- Horizontal split
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { noremap = true, silent = true }) -- Vertical split
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- autoclose setup
require("autoclose").setup()

-- lualine setup
require("lualine").setup()

-- general settings
vim.keymap.set("n", "<leader>e", ":Ex<CR>", {})

require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
-- make nvim transparent
--
-- Theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.termguicolors = true
require("bufferline").setup({})
-- Formating

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettier" },
		css = { "prettier" },
	},
})
require("conform").setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

require("lazy").setup({
	{
		"vidocqh/auto-indent.nvim",
		opts = {},
	},
})
require("nvim-treesitter.configs").setup({
	indent = {
		enable = true,
	},
})
require("colorizer").setup()
vim.keymap.set("i", "jj", "<Esc>")
