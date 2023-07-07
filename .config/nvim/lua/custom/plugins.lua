local plugins = {
  { 'christoomey/vim-tmux-navigator', lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require 'configs.treesitter',
  },
  {
   "williamboman/mason.nvim",
   opts = require 'configs.mason',
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
