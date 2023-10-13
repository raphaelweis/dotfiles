require("gruvbox").setup({
	transparent_mode = false,
	italic = {
		strings = false,
		comments = true,
		operators = false,
		folds = true,
	},
	overrides = {
		SignColumn = { bg = "none" },
		-- handle keyword highlighting with lsp instead of treesitter because treesitter-dart is buggy
		["@lsp.type.keyword.dart"] = { fg = "#fb4934" },
	},
})
vim.cmd.colorscheme("gruvbox")
