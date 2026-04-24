require("snacks").setup({
  bigfile = { enabled = true },
  indent = {
    enabled = true,
    animate = { enabled = false, },
  },
  lazygit = { configure = false },
  picker = { enabled = true },
  quickfile = { enabled = true },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})
