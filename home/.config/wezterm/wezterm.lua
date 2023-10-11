-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Convenience variables
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("gui-startup", function(cmd)
	---@diagnostic disable-next-line: unused-local
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.color_scheme = "Gruvbox Dark (Gogh)"
config.window_frame = {
	active_titlebar_bg = "#3c3836",
	inactive_titlebar_bg = "#3c3836",
}
config.window_decorations = "RESIZE"
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#282828",
			fg_color = "#ebdbb2",
		},
		inactive_tab = {
			bg_color = "#3c3836",
			fg_color = "#928374",
		},
		new_tab = {
			bg_color = "#3c3836",
			fg_color = "#928374",
		},
	},
}
config.keys = {
	{
		key = "w",
		mods = "CTRL",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "t",
		mods = "CTRL",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "v",
		mods = "CTRL|ALT",
		action = act.SplitHorizontal,
	},
	{
		key = "p",
		mods = "CTRL|ALT",
		action = act.SplitVertical,
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

-- and finally, return the configuration to wezterm
return config
