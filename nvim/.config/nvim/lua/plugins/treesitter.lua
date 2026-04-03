local utils = require("utils")
vim.pack.add({ utils.gh("nvim-treesitter/nvim-treesitter") })

require("nvim-treesitter").install({
	"rust",
	"javascript",
	"typescript",
	"css",
})
