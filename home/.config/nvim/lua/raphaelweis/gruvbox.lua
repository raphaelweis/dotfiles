require("gruvbox").setup({
	transparent_mode = false,
	italic = {
		strings = false,
		comments = true,
		operators = false,
		folds = true,
	},
	overrides = {
		["@lsp.type.keyword"] = { fg = "#fb4934" },
	},
})
vim.cmd.colorscheme("gruvbox")
