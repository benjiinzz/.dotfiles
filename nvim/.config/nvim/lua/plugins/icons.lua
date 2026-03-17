return {
	{
	'nvim-tree/nvim-web-devicons'
},{
	'nvimdev/nerdicons.nvim',
	options = {
		register = '*',
	},
	config = function ()
		require('nerdicons').setup({})
		vim.keymap.set('n', '<leader>si', '<cmd>NerdIcons<CR>', {desc = '[S]earch [I]cons'})
	end
}}
