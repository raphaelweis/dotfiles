----------
-- Options
----------
vim.g.mapleader = " "

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true

----------
-- Keymaps
----------
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Schedule the clipboard sync after `UiEnter` because it can increase startup time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

----------
-- Plugins
----------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					build = (function()
						if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
							return
						end
						return "make install_jsregexp"
					end)(),
					dependencies = {
						{
							"rafamadriz/friendly-snippets",
							config = function()
								require("luasnip.loaders.from_vscode").lazy_load()
							end,
						},
					},
				},
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
			},
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")
				luasnip.config.setup({})

				cmp.setup({
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					completion = { completeopt = "menu,menuone,noinsert" },

					mapping = cmp.mapping.preset.insert({
						["<C-n>"] = cmp.mapping.select_next_item(),
						["<C-p>"] = cmp.mapping.select_prev_item(),
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-y>"] = cmp.mapping.confirm({ select = true }),
						["<C-Space>"] = cmp.mapping.complete({}),
						["<C-l>"] = cmp.mapping(function()
							if luasnip.expand_or_locally_jumpable() then
								luasnip.expand_or_jump()
							end
						end, { "i", "s" }),
						["<C-h>"] = cmp.mapping(function()
							if luasnip.locally_jumpable(-1) then
								luasnip.jump(-1)
							end
						end, { "i", "s" }),
					}),
					sources = {
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "path" },
					},
				})
			end,
		},
		{
			"stevearc/oil.nvim",
			opts = {},
			keys = {
				{ "<leader>e", "<CMD>Oil<CR>" },
			},
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
		},
		{
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
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					markdown = { "prettier" },
					sh = { "shfmt" },
				},
			},
		},
		{
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
					harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" })
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
		},
		{
			"tpope/vim-fugitive",
			keys = { { "<leader>;", "<CMD>tab Git<CR>" } },
		},
		{
			"lewis6991/gitsigns.nvim",
			opts = {},
		},
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
				"TmuxNavigatorProcessList",
			},
			keys = {
				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
				{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
			},
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
			},
			config = function()
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
					callback = function(event)
						local map = function(keys, func, desc, mode)
							mode = mode or "n"
							vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
						end

						map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
						map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
						map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
						map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
						map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
						map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x", "v" })
						map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
						map("td", function()
							local new_config = not vim.diagnostic.config().virtual_lines
							vim.diagnostic.config({ virtual_lines = new_config })
						end, "[T]oggle [D]iagnostic virtual lines")

						if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
							map("<leader>th", function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
							end, "[T]oggle Inlay [H]ints")
						end
					end,
				})

				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities =
					vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

				local servers = {
					lua_ls = {
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
								runtime = {
									version = "LuaJIT",
								},
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
										"${3rd}/luv/library",
									},
									diagnostics = { disable = { "missing-fields" } },
								},
							},
						},
					},
				}

				for server, config in pairs(servers) do
					require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, config))
				end
			end,
		},
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			},
			config = function()
				local telescope = require("telescope")

				-- Telescope setup function
				telescope.setup({})

				-- Telescope extensions
				telescope.load_extension("fzf")

				-- Telescope keymap configuration
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>fh", builtin.help_tags)
				vim.keymap.set("n", "<leader>ff", builtin.find_files)
				vim.keymap.set("n", "<leader>fs", builtin.live_grep)
				vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
				vim.keymap.set("n", "<leader><leader>", builtin.buffers)
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			main = "nvim-treesitter.configs",
			opts = {},
			config = function()
				require("nvim-treesitter.configs").setup({
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
		},
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup()
			end,
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
			opts = {},
		},
		{
			"sainnhe/gruvbox-material",
			lazy = false,
			priority = 1000,
			config = function()
				vim.g.gruvbox_material_foreground = "original"
				vim.cmd.colorscheme("gruvbox-material")
			end,
		},
	},
	checker = { enabled = false },
	change_detection = { notify = false },
})
