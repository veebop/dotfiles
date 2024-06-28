-- These will be overridden by auto-dark-mode.nvim, but it prevents a brief flash on startup
vim.opt.background = "light"
vim.cmd('colorscheme bamboo')

vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.formatoptions:remove { "l", "t", "c" } -- Don't auto wrap lines in insert mode
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.laststatus = 0 -- Will be enabled by lualine
vim.opt.linebreak = true -- Break lines at `breakat` characters
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '󰌒 ', trail = '' } -- Whitespace chars to show
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.ruler = false
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor.
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.showcmd = false
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.sidescrolloff = 8 -- minimal number of screen lines to keep left and right of the cursor.
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- smart case
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.textwidth = 78 -- Set length for hard wrapping, 0 disables this
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion
vim.opt.wrap = false -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program it is not allowed to be edited

-- I want to have a 'soft' cutoff at line 80, and a 'hard' cutoff at line 120
vim.opt.colorcolumn = { 80, 120, 121 }

-- Code folding via treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Spellchecking
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Command that shows the diff between the current buffer and last write
-- See ':help :DiffOrig' and https://www.reddit.com/r/neovim/comments/15ue6vh/comment/jwpbbvr/
vim.api.nvim_create_user_command('DiffOrig', function()
  local scratch_buffer = vim.api.nvim_create_buf(false, true)
  local current_ft = vim.bo.filetype
  vim.cmd('vertical sbuffer' .. scratch_buffer)
  vim.bo[scratch_buffer].filetype = current_ft
  vim.cmd('read ++edit #')     -- load contents of previous buffer into scratch_buffer
  vim.cmd.normal('1G"_d_')     -- delete extra newline at top of scratch_buffer without overriding register
  vim.cmd.diffthis()           -- scratch_buffer
  vim.cmd.wincmd('p')
  vim.cmd.diffthis()           -- current buffer
end, {})

-- Change diagnostic symbols
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
