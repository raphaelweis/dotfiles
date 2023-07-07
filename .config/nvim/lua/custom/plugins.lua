local plugins = {
  { 'christoomey/vim-tmux-navigator', lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require 'custom.configs.treesitter',
  },
  {
   "williamboman/mason.nvim",
   opts = require 'custom.configs.mason',
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require 'custom.configs.nvim-cmp'
  }
}

return plugins
