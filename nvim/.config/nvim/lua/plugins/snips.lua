local utils = require('utils')

vim.pack.add({utils.gh('rafamadriz/friendly-snippets')})

require('luasnip.loaders.from_vscode').lazy_load()

