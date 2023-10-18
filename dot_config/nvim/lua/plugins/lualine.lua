local M = {}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

function M.setup()
  require('lualine').setup({
    options = {
      disabled_filetypes = { "alpha" },
    },
    sections = {
      lualine_b = { { 'b:gitsigns_head', icon = '' }, { 'diff', diff = diff_source() }, 'diagnostics', },
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
    },
    extensions = { 'lazy', 'mason', 'nvim-tree', }
  })
end

return M
