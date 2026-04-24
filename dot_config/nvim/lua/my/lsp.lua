-- This file is for defining language servers to use
-- Configuration should be done in `after/lsp/`
vim.lsp.enable({
  "basedpyright",
  "bashls", -- Requires shellcheck and shfmt
  "clangd",
  "lua_ls",
  "ruff",
  "rust_analyzer",
  "sourcekit",
  "tinymist",
  "ts_ls",
})
