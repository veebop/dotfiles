local M = {}

M.setup = function()
  local rt = require("rust-tools")

  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Code action groups
        vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      end,
    },
  })
end
return M
