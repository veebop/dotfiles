-- This file is for configuring Neovim's LSP and for enabling servers
-- Server-specific configuration should be done in `after/lsp/`
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
  "zls",
})
