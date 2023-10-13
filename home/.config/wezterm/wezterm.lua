-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Set convenience locals
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- Config builder for clearer error messages.
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Spawn a maximized window everytime wezterm is spawned.
wezterm.on("gui-startup", function(cmd)
	---@diagnostic disable-next-line: unused-local
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Colorscheme configuration
local PRIMARY_BG = "#282828"
local SECONDARY_BG = "#3c3836"
local INACTIVE_FG = "#928374"
local ACTIVE_FG = "#ebdbb2"
config.color_scheme = "Gruvbox Dark (Gogh)"
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = PRIMARY_BG,
			fg_color = ACTIVE_FG,
		},
		inactive_tab = {
			bg_color = SECONDARY_BG,
			fg_color = INACTIVE_FG,
		},
		new_tab = {
			bg_color = SECONDARY_BG,
			fg_color = INACTIVE_FG,
		},
	},
}
config.window_frame = {
	active_titlebar_bg = SECONDARY_BG,
	inactive_titlebar_bg = SECONDARY_BG,
}

-- Window configuration
config.window_decorations = "RESIZE" -- No window title but allow resizing.

-- Font configuration
config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- This disables ligatures

-- Keyboard shortcuts configuration
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
for i = 1, 9 do -- Assign keybinds for tabs 1 through 9.
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

-- and finally, return the configuration to wezterm
return config
