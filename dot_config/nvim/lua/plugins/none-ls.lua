local M = {}

function M.setup()
  require("mason-null-ls")
  local nls = require("null-ls")
  nls.setup({
    sources = {
      nls.builtins.diagnostics.codespell,
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.yapf,
      -- You have to install these outside of mason-null-ls
      -- They usually come with the toolchain
      nls.builtins.formatting.swift_format,
    }
  })
end

return M
