local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
		vim.schedule(function()
			vim.cmd("TSUpdate")
		end)
		require("nvim-treesitter").after_update()
	end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = ""
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("LspFormattingGroup", {}),
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
