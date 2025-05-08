local M = {}

function M.setup_lspconfig()
  require("mason").setup()
  require("mason-lspconfig").setup({
    -- Automatically start language servers installed via Mason
    automatic_enable = {
      exclude = {
        "rust_analyzer", -- This is started by rustaceanvim
      }
    }
  })
end

return M
