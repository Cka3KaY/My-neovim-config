require("config.lazy")

-- Telescope keybindings
-- vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
--------------------------------------------
-- Settings
--------------------------------------------
vim.opt.shiftwidth = 2 -- Set indentation width
vim.opt.softtabstop = 2 -- Make backspace behave properly
vim.opt.expandtab = true -- Use spaces instead of tabs
-- vim.opt.smartindent = true -- Auto-indents based on syntax
vim.opt.autoindent = true -- Maintains indentation from the previous line
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.termguicolors = true
-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 3
--------------------------------------------
-- Keymaps
--------------------------------------------
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
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
--vim.keymap.set("n", "<leader>e", ":Ex<CR>", {})
vim.keymap.set("n", "<Leader>rh", ":vertical resize -2<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<Leader>rl", ":vertical resize +2<CR>", { desc = "Increase split width" })
vim.keymap.set("n", "<Leader>rj", ":resize -2<CR>", { desc = "Decrease split height" })
vim.keymap.set("n", "<Leader>rk", ":resize +2<CR>", { desc = "Increase split height" })
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
--------------------------------------------
-- Setups
--------------------------------------------
require("Comment").setup()
require("mini.surround").setup()
require("autoclose").setup()
require("lualine").setup()
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = false,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {
		bright_red = "#ea6962",
		bright_green = "#b8bb26",
		bright_yellow = "#fabd2f",
		bright_blue = "#83a598",
		bright_purple = "#d3869b",
		bright_aqua = "#8ec07c",
		bright_orange = "#fe8019",

		red = "#ea6962",
		green = "#a9b665",
		yellow = "#eab56b",
		blue = "#7daea3",
		purple = "#d3869b",
		aqua = "#89b482",
		orange = "#e78a4e",

		gray = "#928374",
		fg = "#dfbf8e",
		bg = "#282828",
		bg0_h = "#1c1f20",
		bg0 = "#282828",
		bg1 = "#32302f",
		bg2 = "#45403d",
		bg3 = "#5a524c",
		bg4 = "#7c6f64",

		bg_red = "#ff5a5a",
		bg_green = "#b8bb26",
		bg_yellow = "#fabd2f",
		bg_blue = "#83a598",
		bg_purple = "#d3869b",
		bg_aqua = "#8ec07c",
		bg_orange = "#fe8019",
	},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
-- require("catppuccin").setup({
-- 	transparent_background = true,
-- })
-- values shown are defaults and will be used if not provided
require("colorizer").setup()
--------------------------------------------
-- Theme
--------------------------------------------
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd.colorscheme("catppuccin-macchiato")
--------------------------------------------
-- Formating
--------------------------------------------
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
--------------------------------------------
-- Some other stuff
vim.keymap.set("i", "jj", "<Esc>")
