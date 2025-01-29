return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{ "3rd/image.nvim", opts = {} },
	},
	opts = {
		image_support = true,
	},
}
