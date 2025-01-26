return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		})

		-- Automatically detect hypr files
		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
		-- Automatically detect rasi files
		vim.filetype.add({
			pattern = { ["*%.rasi"] = "rasi" },
		})
	end,
}
