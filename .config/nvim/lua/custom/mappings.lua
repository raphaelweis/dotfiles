local M = {}

M.disabled = {
	n = {
		["<C-h>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",
		["<C-l>"] = "",
	},
}

M.abc = {
	n = {
		["<leader>sv"] = { "<CMD>vsplit<CR>", "Split current buffer vertically" },
		["<leader>sh"] = { "<CMD>split<CR>", "Split current buffer vertically" },
		["<leader>se"] = { "<C-w>=", "Make current split windows equal in width and height" },
		["<leader>sx"] = { "<CMD>close<CR>", "Close current window" },

        ["<leader>bn"] = { "<CMD>bn<CR>", "Go to next opened buffer" },
        ["<leader>bp"] = { "<CMD>bp<CR>", "Go to previous opened buffer" },
        ["<leader>bx"] = { "<CMD>bd<CR>", "Close current buffer" },

		["<leader>e"] = { "<CMD>NvimTreeToggle<CR>", "Toggle nvim tree" },
        ["<leader>fm"] = { "<CMD>FormatWrite<CR>", "Format and write the document" },

		["<leader>ff"] = { "<CMD>Telescope find_files<CR>", "Find files with telescope" },
		["<leader>fh"] = { "<CMD>Telescope find_files hidden=true<CR>", "Find all files with telescope" },
		["<leader>fs"] = { "<CMD>Telescope live_grep<CR>", "Live grep string in current working directory" },
		["<leader>gc"] = { "<CMD>Telescope git_commits<CR>", "List all git commits, checkout selected commit" },
		["<leader>gfc"] = { "<CMD>Telescope git_bcommits<CR>", "List all git commmits only for this file, checkout selected commit",},
		["<leader>gb"] = { "<CMD>Telescope git_branches<CR>", "List all git branches, checkout selected branch" },
		["<leader>gs"] = { "<CMD>Telescope git_status<CR>", "List current changes per file with diff preview" },

        ["<leader>d"] = { "<CMD>lua require('dapui').toggle()<CR>", "Toggle Nvim-Dap UI" }
	},

	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
}

return M
