return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it's the main colorscheme
	priority = 1000, -- colorschemes get higher priority over other plugins
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
			},
		})
	end,
}
