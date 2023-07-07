local plugins = {
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("custom.configs.treesitter"),
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-null-ls.nvim",
				config = function()
					require("custom.configs.mason-null-ls")
				end,
			},
			{
				"williamboman/mason.nvim",
				opts = require("custom.configs.mason"),
			},
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = require("custom.configs.nvim-cmp"),
	},
}

return plugins
