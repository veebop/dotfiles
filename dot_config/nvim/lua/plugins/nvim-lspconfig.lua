local M = {}

function M.setup()
  require("neodev").setup()
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- Language Servers
  lspconfig.bashls.setup {}
  -- Temp (?) fix for the 'multiple offset-encodings' warning for clangd
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.offsetEncoding = 'utf-16'
  lspconfig.clangd.setup {
    capabilities = capabilities,
  }
  lspconfig.cmake.setup {}
  lspconfig.jdtls.setup {}
  lspconfig.jsonls.setup {}
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = "Disable",
        }
      }
    }
  }
  lspconfig.pyright.setup {}
  -- Rust is configured via rust-tools
  lspconfig.sourcekit.setup {
    -- I don't want sourcekit to do lsp for c/cpp files
    filetypes = { "swift", "objective-c", "objective-cpp" },
  }
  lspconfig.tsserver.setup {}
  lspconfig.yamlls.setup {}
  lspconfig.zls.setup {}
end

return M
