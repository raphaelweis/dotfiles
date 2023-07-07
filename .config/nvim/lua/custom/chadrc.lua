-- options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.iskeyword:append("-")

---@type ChadrcConfig
local M = {}
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"

M.ui = {
	theme = "gruvbox",
	nvdash = {
		load_on_startup = true,
	},
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal

		-- default/round/block/arrow (separators work only for "default" statusline theme;
		-- round and block will work for the minimal theme only)
		separator_style = "default",
	},
}
return M
