-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'DiffText', timeout = 150 }
  end,
})

-- Lint after saving
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Format after saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  command = "FormatWrite",
})
