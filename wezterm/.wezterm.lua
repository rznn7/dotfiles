local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/zsh" }
config.enable_tab_bar = false
config.color_scheme = "Oldworld"
config.font_size = 13.1
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font Mono" },
	"MesloLGS Nerd Font Mono",
	"SFMono",
	"Source Han Sans",
	"Noto Color Emoji",
})
config.line_height = 1.1
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- Split layout (2 terminals left, nvim right)
wezterm.on("trigger-dev-split", function(window, pane)
	local cwd = pane:get_current_working_dir()
	if cwd then
		cwd = cwd.file_path
	end

	local nvim_pane = pane:split({
		direction = "Right",
		size = 0.6,
		cwd = cwd,
	})

	local term2 = pane:split({
		direction = "Bottom",
		size = 0.5,
		cwd = cwd,
	})

	nvim_pane:send_text("nvim\n")
end)

-- Tab layout (3 separate tabs)
wezterm.on("trigger-dev-tabs", function(window, pane)
	local cwd = pane:get_current_working_dir()
	if cwd then
		cwd = cwd.file_path
	end

	-- Current tab becomes terminal 1

	-- Create second terminal tab
	window:mux_window():spawn_tab({
		cwd = cwd,
	})

	-- Create nvim tab
	local tab, nvim_pane, _ = window:mux_window():spawn_tab({
		cwd = cwd,
	})

	nvim_pane:send_text("nvim\n")
end)

-- Keybindings
config.keys = {
	-- Your existing shortcuts
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("trigger-dev-split"),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("trigger-dev-tabs"),
	},

	-- Pane navigation (more ergonomic)
	{
		key = "n",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "o",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "i",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "e",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Pane resizing
	{
		key = "n",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "o",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "i",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "e",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
}

return config
