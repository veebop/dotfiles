local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- Any language server installed via Mason should be handled in mason.lua
  lspconfig.sourcekit.setup {
    -- I don't want sourcekit to do lsp for c/cpp files
    filetypes = { "swift", "objective-c", "objective-cpp" },
  }
end

return M
