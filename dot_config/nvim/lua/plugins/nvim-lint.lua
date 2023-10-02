local M = {}

M.setup = function()
  require('lint').linters_by_ft = {
    -- markdown = { 'vale', } -- Example
  }
end

return M
