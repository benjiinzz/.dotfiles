-- Basic keymaps
-- Exit insert mode with jj
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")

-- Navigate panes with Ctrl+Movement keys
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

--Basic options
vim.opt.autoread = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.undofile = true
vim.o.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
