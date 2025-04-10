return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	opts = function(_, opts)
		-- set default picker theme to ivy for all pickers
		opts.defaults = require("telescope.themes").get_ivy({
			layout_config = { height = 0.30 },
		})
	end,
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
