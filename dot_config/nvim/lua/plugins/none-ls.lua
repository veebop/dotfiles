local M = {}

M.setup = function()
  require("mason-null-ls")
  local nls = require("null-ls")
  nls.setup({
    sources = {
      nls.builtins.code_actions.gitsigns,
      nls.builtins.formatting.rustfmt,
      nls.builtins.formatting.zigfmt,
    }
  })
end

return M
