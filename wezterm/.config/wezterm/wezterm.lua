local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_kitty_graphics = true
config.term = "xterm-kitty"
-- font and color-scheme
config.font_size = 14
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("FiraCode")
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
-- tabline

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 120
config.colors = {
	tab_bar = {
		background = "#1e1e2e",

		active_tab = {
			bg_color = "#b4befe",
			fg_color = "#313244",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#6c7086",
		},

		inactive_tab_hover = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
		},
	},
}

-- window pane
config.window_frame = {
	font = wezterm.font("FiraCode", { weight = "Bold" }),
	font_size = 10,
	inactive_titlebar_bg = "#1e1e2e",
	active_titlebar_bg = "#1e1e2e",
}
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}

config.keys = {
	{ key = "%", mods = "CTRL|SHIFT|ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "CTRL|SHIFT|ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
}

return config
