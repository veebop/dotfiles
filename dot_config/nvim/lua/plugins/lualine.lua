local M = {}

function M.setup()
  require('lualine').setup({
    options = {
      disabled_filetypes = { "alpha" },
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
    },
    winbar = {
      lualine_a = { "filename" },
      lualine_b = { "navic" },
      lualine_c = { "searchcount", "selectioncount" },
    },
    inactive_winbar = {
      lualine_a = { "filename" }
    }
  })
end

return M
