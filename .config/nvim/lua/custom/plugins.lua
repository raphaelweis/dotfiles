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
				"williamboman/mason.nvim",
				opts = require("custom.configs.mason"),
			},
			{
				"williamboman/mason-nvim-dap.nvim",
				config = function()
					require("custom.configs.mason-nvim-dap")
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
		"mhartington/formatter.nvim",
		lazy = false,
		config = function()
			require("custom.configs.formatter")
		end,
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
