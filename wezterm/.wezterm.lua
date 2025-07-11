local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/zsh" }
config.font_size = 14
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"MesloLGS Nerd Font Mono",
	"SFMono",
	"Source Han Sans",
})

config.enable_tab_bar = false

config.colors = {
	foreground = "#c9c7cd",
	background = "#161617",
	cursor_bg = "#c9c7cd",
	cursor_fg = "#161617",
	cursor_border = "#c9c7cd",
	selection_bg = "#2a2a2c",
	selection_fg = "#c9c7cd",
	scrollbar_thumb = "#313134",
	split = "#444448",

	tab_bar = {
		background = "#161617",
		active_tab = {
			bg_color = "#2a2a2c",
			fg_color = "#c9c7cd",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#18181a",
			fg_color = "#8b8693",
		},
		inactive_tab_hover = {
			bg_color = "#1b1b1c",
			fg_color = "#b4b1ba",
		},
		new_tab = {
			bg_color = "#161617",
			fg_color = "#6c6874",
		},
		new_tab_hover = {
			bg_color = "#18181a",
			fg_color = "#9f9ca6",
		},
	},

	ansi = {
		"#27272a", -- black
		"#ea83a5", -- red
		"#90b99f", -- green
		"#e6b99d", -- yellow
		"#92a2d5", -- blue
		"#aca1cf", -- magenta
		"#85b5ba", -- cyan
		"#c9c7cd", -- white
	},

	brights = {
		"#6c6874", -- bright black
		"#ea83a5", -- bright red
		"#90b99f", -- bright green
		"#e6b99d", -- bright yellow
		"#92a2d5", -- bright blue
		"#e29eca", -- bright magenta
		"#85b5ba", -- bright cyan
		"#c9c7cd", -- bright white
	},

	indexed = {
		[16] = "#f5a191", -- orange
		[17] = "#e29eca", -- bright magenta
		[18] = "#18181a", -- gray0
		[19] = "#1b1b1c", -- gray1
		[20] = "#2a2a2c", -- gray2
		[21] = "#313134", -- gray3
		[22] = "#3b3b3e", -- gray4
		[23] = "#444448", -- gray5
		[24] = "#6c6874", -- subtext4
		[25] = "#8b8693", -- subtext3
		[26] = "#9f9ca6", -- subtext2
		[27] = "#b4b1ba", -- subtext1
		[28] = "#131314", -- bg_dark
	},
}

return config
