local utils = require("utils")
vim.pack.add({ utils.gh("folke/trouble.nvim") })

require("trouble").setup({
	icons = {
		indent = {
			middle = " ",
			last = " ",
			top = " ",
			ws = "│  ",
		},
	},
	modes = {
		diagnostics = {
			auto_open = true,
			auto_close = true,
			groups = {
				{ "filename", format = "{file_icon} {basename:Title} {count}" },
			},
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.3,
			},
		},
		lsp = {
			win = {
				position = "right",
			},
			auto_open = false,
			auto_close = true,
			preview = {
				type = "split",
				relative = "win",
				position = "bottom",
				size = 0.3,
			},
		},
	},
})

-- diagnostics list with inline split preview
vim.keymap.set("n", "<leader>td", ":Trouble diagnostics<CR>", { desc = "Trouble diagnostics" })
-- lsp references/definitions etc on demand
vim.keymap.set("n", "<leader>tl", ":Trouble lsp<CR>", { desc = "Trouble LSP" })
vim.keymap.set("n", "<leader>ts", ":Trouble symbols<CR>", { desc = "Trouble symbols" })
vim.keymap.set("n", "<leader>td", ":Trouble lsp_definitions<CR>", { desc = "LSP definitions" })
vim.keymap.set("n", "<leader>tr", ":Trouble lsp_references<CR>", { desc = "LSP references" })
