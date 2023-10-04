-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'DiffText', timeout = 150 }
  end,
})

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("LspFormat", {}),
  desc = "Auto format",
  command = "lua vim.lsp.buf.format({ async = false})",
})

-- Event emitted when a directory is opened - Useful for nvim-tree
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("_dir_opened", {}),
  nested = true,
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    if require("utils").is_directory(bufname) then
      vim.api.nvim_del_augroup_by_name "_dir_opened"
      vim.cmd "do User DirOpened"
      vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
    end
  end,
})
