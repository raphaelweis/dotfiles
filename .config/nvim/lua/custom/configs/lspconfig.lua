local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- for lspconfig: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- for mason: https://github.com/williamboman/mason-lspconfig.nvim

local lspconfig = require "lspconfig"
local servers = {
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  "dartls",
  "dockerls",
  "html",
  "intelephense",
  "jdtls",
  "jedi_language_server",
  "jsonls",
  "marksman",
  "rust_analyzer",
  "sqlls",
  "tsserver",
  "vimls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
