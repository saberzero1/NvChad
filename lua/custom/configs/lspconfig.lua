-- Check here for default config:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "sqls", "lua_ls", "gopls", "csharp_ls", "anakin_language_server", "rust_analyzer", "zls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
