return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	keys = {
		{ "<leader>e", "<CMD>Oil<CR>" },
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
