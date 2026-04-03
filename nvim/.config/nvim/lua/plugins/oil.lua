local utils = require("utils")
vim.pack.add({ utils.gh("stevearc/oil.nvim") })

require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 2,
		max_width = 80,
		max_height = 30,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
})

vim.keymap.set("n", "<leader>e", require("oil").open_float, { desc = "Open file explorer" })
