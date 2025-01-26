return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it's the main colorscheme
	priority = 1000, -- colorschemes get higher priority over other plugins
	config = function()
		require("github-theme").setup()

		local palette = require("github-theme.palette").load("github_dark_default")

		local TelescopeColor = {
			TelescopePromptNormal = { bg = palette.scale.gray[8] },
			TelescopePromptBorder = { bg = palette.scale.gray[8], fg = palette.scale.gray[8] },
			TelescopePromptTitle = { bg = palette.red.base, fg = palette.black.base },
			TelescopePromptPrefix = { bg = palette.scale.gray[8], fg = palette.red.base },

			TelescopeResultsNormal = { bg = palette.scale.gray[9] },
			TelescopeResultsBorder = { bg = palette.scale.gray[9], fg = palette.scale.gray[9] },
			TelescopeResultsTitle = { bg = palette.scale.gray[9], fg = palette.scale.gray[9] },

			TelescopePreviewNormal = { bg = palette.scale.gray[9] },
			TelescopePreviewBorder = { bg = palette.scale.gray[9], fg = palette.scale.gray[9] },
			TelescopePreviewTitle = { bg = palette.green.base, fg = palette.black.base },
		}

		for hl, col in pairs(TelescopeColor) do
			vim.api.nvim_set_hl(0, hl, col)
		end
	end,
}
