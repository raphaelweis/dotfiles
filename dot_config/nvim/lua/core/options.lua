vim.g.mapleader = " "

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10

-- Schedule the clipboard sync after `UiEnter` because it can increase startup time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
