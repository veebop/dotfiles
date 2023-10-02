local M = {}

M.setup = function()
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- Language Servers
  lspconfig.bashls.setup {}
  lspconfig.clangd.setup {}
  lspconfig.cmake.setup {}
  lspconfig.jdtls.setup {}
  lspconfig.jsonls.setup {}
  lspconfig.lua_ls.setup {}
  lspconfig.pyright.setup {}
  -- Rust is configured via rust-tools
  lspconfig.tsserver.setup {}
  lspconfig.yamlls.setup {}
  lspconfig.zls.setup {}
end

return M
