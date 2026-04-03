local utils = require('utils')

vim.pack.add({utils.gh(	'windwp/nvim-autopairs')})

require('nvim-autopairs').setup({
	disable_filetype = {"TelescopePrompt", "vim"},
    ignored_next_char = "[%w%.]"})


