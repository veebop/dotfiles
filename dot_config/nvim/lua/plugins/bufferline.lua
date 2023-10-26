local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
      tab_size = 12,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
              or (e == "warning" and " " or "󰌶 ")
          s = s .. n .. sym
        end
        return s
      end,
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "󰐃" })
        }
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        }
      }
    }
  }
end

return M
