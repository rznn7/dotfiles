local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/zsh" }
config.font_size = 14
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"MesloLGS Nerd Font Mono",
	"SFMono",
	"Source Han Sans",
	"Noto Color Emoji",
})
config.adjust_window_size_when_changing_font_size = false
config.enable_tab_bar = false

config.color_scheme = "Oldworld"

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

return config
