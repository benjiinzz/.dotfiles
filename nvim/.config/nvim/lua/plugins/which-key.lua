local utils = require("utils")

vim.pack.add({ utils.gh("folke/which-key.nvim") })

require("which-key").setup({
	-- delay between pressing a key and opening which-key (milliseconds)
	-- this setting is independent of vim.o.timeoutlen
	delay = 0,
	preset = "helix",
	icons = {
		-- set icon mappings to true if you have a Nerd Font
		mappings = vim.g.have_nerd_font,
		-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
		-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰁮",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},

	-- Document existing key chains
	spec = {
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>t", group = "[T]rouble" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		{ "<leader>d", group = "[D]ebug" },
		{ "<leader>g", group = "[G]it" },
	},
})
