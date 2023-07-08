local plugins = {
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("custom.configs.treesitter"),
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("custom.configs.neodev")
		end,
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
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.nvim-dap")
		end,
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("custom.configs.nvim-dap-ui")
				end,
			},
		},
	},
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
}

return plugins
