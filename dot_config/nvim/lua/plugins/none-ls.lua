local M = {}

function M.setup()
  require("mason-null-ls")
  local nls = require("null-ls")
  nls.setup({
    sources = {
      nls.builtins.code_actions.proselint.with({ filetypes = { "markdown", "text", "norg" } }),
      nls.builtins.diagnostics.alex.with({ filetypes = { "markdown", "text", "norg" } }),
      nls.builtins.diagnostics.codespell,
      nls.builtins.diagnostics.proselint.with({ filetypes = { "markdown", "text", "norg" } }),
      nls.builtins.diagnostics.write_good.with({ filetypes = { "markdown", "text", "norg" } }),
      nls.builtins.formatting.yapf,
      -- You have to install these outside of mason-null-ls
      -- They usually come with the toolchain
      nls.builtins.formatting.swift_format,
    }
  })
end

return M
