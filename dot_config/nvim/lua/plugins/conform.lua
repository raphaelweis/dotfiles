return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define formatters
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}
