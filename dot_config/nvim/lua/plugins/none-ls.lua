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
      nls.builtins.formatting.clang_format,
      -- You have to install these outside of mason-null-ls
      -- They usually come with the toolchain
      nls.builtins.formatting.rustfmt,
      nls.builtins.formatting.swift_format,
      nls.builtins.formatting.zigfmt,
    }
  })
end

return M
