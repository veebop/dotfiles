local M = {}

function M.setup()
  require("mason-nvim-dap")
  require('telescope').load_extension('dap')
end

return M
