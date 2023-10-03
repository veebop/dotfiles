local M = {}

M.setup = function()
  local nls = require("null-ls")
  nls.setup({
    sources = {
      nls.builtins.code_actions.gitsigns,
      nls.builtins.code_actions.proselint,
      nls.builtins.diagnostics.proselint,
      nls.builtins.diagnostics.alex,
      nls.builtins.diagnostics.codespell,
      nls.builtins.formatting.rustfmt,
      nls.builtins.formatting.zigfmt,
    }
  })
end

return M
