local plugins = {
  { 'christoomey/vim-tmux-navigator', lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "svelte",
        "dart",
        "php",
        "c",
        "rust",
        "zig"
      },
    },
  },
  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "bash-language-server",
        "clangd",
        "cmake-language-server",
        "css-lsp",
        "dockerfile-language-server",
        "html-lsp",
        "json-lsp",
        "jdtls",
        "typescript-language-server",
        "texlab",
        "lua-language-server",
        "marksman",
        "intelephense",
        "jedi-language-server",
        "rust-analyzer",
        "sqls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
