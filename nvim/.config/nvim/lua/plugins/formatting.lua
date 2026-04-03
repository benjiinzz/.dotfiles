local utils = require("utils")

vim.pack.add({ utils.gh("stevearc/conform.nvim") })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

vim.keymap.set("n", "<leader>b", function()
	require("conform").format({ async = true, lsp_format = "never" })
end, { desc = "Format [B]uffer" })

