-----------------------------
-- Options
-----------------------------
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search
vim.opt.hlsearch = false

-- Hide current cmd
vim.opt.showcmd = false

-- Make line numbers default
vim.opt.number = true

-- Disable line wrapping
vim.opt.wrap = false

-- Configure tabstop and shiftwidth
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

vim.opt.iskeyword:append("-")

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ helper function for indentation based on filetype ]]
local function setIndentation(filetype, shiftwidth, softtabstop, tabstop, expandtab)
	vim.api.nvim_create_autocmd("FileType", {
		callback = function()
			vim.bo.shiftwidth = shiftwidth
			vim.bo.softtabstop = softtabstop
			vim.bo.tabstop = tabstop
			vim.bo.expandtab = expandtab
		end,
		pattern = filetype,
	})
end

-- Set 2 spaces for these filetypes
setIndentation("dart", 2, 2, 2, 1)
setIndentation("c", 2, 2, 2, 1)
setIndentation("nix", 2, 2, 2, 1)
setIndentation("html", 2, 2, 2, 1)
