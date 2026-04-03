local utils = require("utils")

vim.pack.add({ utils.gh("nvim-mini/mini.nvim") })

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.comment").setup()
