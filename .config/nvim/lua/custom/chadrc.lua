---@type ChadrcConfig 
local M = {}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = 'gruvbox',
  nvdash = {
    load_on_startup = true
  }
}
return M

