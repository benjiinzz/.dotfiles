local utils = require("utils")
vim.pack.add({
	utils.gh("mfussenegger/nvim-dap"),
	utils.gh("rcarriga/nvim-dap-ui"),
	utils.gh("jay-babu/mason-nvim-dap.nvim"),
	utils.gh("nvim-neotest/nvim-nio"),
	utils.gh("williamboman/mason.nvim"),
})

require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
	automatic_installation = true,
	handlers = {},
})
local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug [I]nto" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug [O]ver" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "[D]ebug [O]ut" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "[D]ebug [U]I toggle" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "[D]ebug [T]erminate" })
