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

-- Completions for Cargo.toml
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    require('cmp').setup.buffer({ sources = { { name = "crates" } } })
  end,
})

-- Change color columns for git commit
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  group = vim.api.nvim_create_augroup("GitCommitCC", {}),
  desc = "Change color columns for git commit",
  callback = function()
    vim.opt_local.colorcolumn = { 50 }
  end,
})

-- Automatic relative numbers toggle
local numtoggle = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = numtoggle,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = numtoggle,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd "redraw"
    end
  end,
})

----- BUFFER SPECIFIC KEYBINDINGS -----
-- TODO: Move most of these to ftplugin files instead.
local kb = require("keybindings")

-- Lsp keybindings
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspBinds", {}),
  desc = "Keybinds for LSP",
  callback = function(args)
    kb.lsp_keybindings(args.buf)
  end,
})

-- Rust keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  group = vim.api.nvim_create_augroup("RustBinds", {}),
  desc = "Keybindings for rust files",
  callback = function(args)
    kb.rust_keybindings(args.buf)
  end,
})

-- Cargo.toml keybindings
vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "Cargo.toml" },
  group = vim.api.nvim_create_augroup("CrateBinds", {}),
  desc = "Keybindings for Cargo.toml",
  callback = function(args)
    kb.crate_keybindings(args.buf)
  end,
})

-- Clangd (C + C++) keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  group = vim.api.nvim_create_augroup("ClangdBinds", {}),
  desc = "Keybindings for C/C++",
  callback = function(args)
    kb.clangd_keybindings(args.buf)
  end,
})

-- Markdown keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  group = vim.api.nvim_create_augroup("MarkdownBinds", {}),
  desc = "Keybind hints for markdown files",
  callback = function(args)
    kb.markdown_keybindings(args.buf)
  end,
})

-- TeX keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex" },
  group = vim.api.nvim_create_augroup("TexBinds", {}),
  desc = "Keybindings for TeX",
  callback = function(args)
    kb.tex_keybindings(args.buf)
  end,
})
