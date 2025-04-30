local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/zsh" }
config.font_size = 14
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"MesloLGS Nerd Font Mono",
	"Source Han Sans",
})
config.enable_tab_bar = false
config.color_scheme = "rose-pine"
config.window_background_opacity = 0.98

return config
