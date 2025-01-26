return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("chezmoi").setup({
			edit = {
				watch = true,
				force = true,
			},
			notification = {
				on_open = true,
				on_apply = true,
				on_watch = false,
			},
		})
		vim.keymap.set("n", "<leader>aa", require("chezmoi.commands").apply, {})
	end,
}
