local M = {}

function M.setup()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},  -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = {      -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/Documents/Neorg/notes",
          },
          default_workspace = "notes",
        },
      },
      ["core.summary"] = {},
    },
  }
end

return M
