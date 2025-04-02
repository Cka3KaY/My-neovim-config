return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = true,
	opts = ...,
	config = function()
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

		vim.o.background = "dark" -- or "light" for light mode
		vim.cmd([[colorscheme gruvbox]])
	end,
}
