local utils = require("utils")
vim.pack.add({
	utils.gh("sindrets/diffview.nvim"),
	utils.gh("nvim-lua/plenary.nvim"),
})

require("diffview").setup()

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "[G]it [D]iff open" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "[G]it [H]istory" })
vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", { desc = "[G]it [F]ile history (current)" })
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "[G]it [C]lose diffview" })
