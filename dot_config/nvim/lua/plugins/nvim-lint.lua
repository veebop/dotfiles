-- CURRENTLY UNUSED IN FAVOR OF NONE-LS
local M = {}

function M.setup()
  require('lint').linters_by_ft = {
    -- markdown = { 'vale', } -- Example
  }
end

return M
