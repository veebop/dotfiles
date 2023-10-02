local M = {}

M.setup = function()
  require('lualine').setup({
    options = {
      disabled_filetypes = { statusline = { "alpha" } },
    },
    sections = {
      lualine_c = {
        {
          'filename',
          file_status = true,
          newfile_status = true,
          path = 1,
        }
      },
      lualine_x = {
        {
          'encoding',
          { 'fileformat', icons_enabled = false, },
          'filetype',
        }
      }
    }
  })
end

return M
