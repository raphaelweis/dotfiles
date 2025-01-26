return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>yf", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "solid", title_pos = "center" })
		end)

		vim.keymap.set("n", "<leader>u", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>i", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>o", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>p", function()
			harpoon:list():select(4)
		end)
	end,
}
