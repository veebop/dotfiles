vim.opt.clipboard = {}
vim.opt.complete:append("o")
vim.opt.completeopt = { "menuone", "popup", "noselect", "fuzzy" }
vim.opt.fileencoding = "utf-8"                  -- The encoding written to a file
vim.opt.formatoptions:remove({ "l", "t", "c" }) -- Don't auto wrap lines in insert mode
vim.opt.hidden = true                           -- Required to keep multiple buffers and open multiple buffers
vim.opt.ignorecase = true                       -- Ignore case in search patterns (see smartcase)
vim.opt.linebreak = true                        -- Break lines at `breakat` characters
vim.opt.modeline = false                        -- Disable modeline (Per-file options set in file)
vim.opt.mouse = "a"                             -- Allow the mouse to be used in neovim
vim.opt.path:append({ "**" })                   -- Add directories recursively to path
vim.opt.smartcase = true                        -- Ignore case until search contains uppercase characters
vim.opt.splitbelow = true                       -- Force all horizontal splits to go below current window
vim.opt.splitright = true                       -- Force all vertical splits to go to the right of current window
vim.opt.swapfile = true                         -- Creates a swapfile
vim.opt.textwidth = 78                          -- Set length for hard wrapping, 0 disables this
vim.opt.timeoutlen = 1000                       -- Time to wait for a mapped sequence to complete (in milliseconds) (default 1000)
vim.opt.undofile = true                         -- Enable persistent undo
vim.opt.updatetime = 1000                       -- Write to the swap file faster (default 4000)
vim.opt.wrap = false                            -- Display lines as one long line
vim.opt.writebackup = false                     -- If a file is being edited by another program it is not allowed to be edited

-- Appearance
-- vim.opt.background = "dark"
vim.opt.cmdheight = 1             -- Screen lines to use for the command-line (default 1)
vim.opt.conceallevel = 0          -- Show concealed text normally
vim.opt.cursorline = true         -- Highlight the current line
vim.opt.guifont = "monospace:h17" -- The font used in graphical neovim applications
vim.opt.hlsearch = true           -- Highlight all matches on previous search pattern
vim.opt.laststatus = 2            -- Always include statusline
vim.opt.list = true               -- Show whitespace characters (see listchars)
vim.opt.listchars = { tab = '|->', trail = '~' }
vim.opt.number = true             -- Set numbered lines
vim.opt.numberwidth = 4           -- Set number column width (default 4)
vim.opt.pumborder = "rounded"     -- Style of popup (completion) border
vim.opt.pumheight = 10            -- Max items in popup (completion) menu
vim.opt.relativenumber = true     -- Relative numbered lines
vim.opt.ruler = true              -- Display ruler
vim.opt.scrolloff = 8             -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.showcmd = false           -- Show commands in progress
vim.opt.showmode = true           -- Show current mode
vim.opt.sidescrolloff = 8         -- Minimal number of screen lines to keep left and right of the cursor.
vim.opt.signcolumn = "auto:1-3"   -- Allow the sign column to grow to fit more elements
vim.opt.termguicolors = true      -- Set term gui colors (most terminals support this)
vim.opt.title = true              -- Set the title of window to the value of the titlestring
vim.opt.winborder = "rounded"     -- Display rounded border around floating windows

-- Tabs/indents
vim.opt.expandtab = true -- Insert spaces instead of tabs
vim.opt.shiftwidth = 2   -- Use n spaces instead of tabs for indents
vim.opt.softtabstop = -1 -- Insert the same number of spaces as shiftwidth when hitting tab
vim.opt.tabstop = 8      -- Show tabs as n characters

-- I want to have a 'soft' cutoff at line 80, and a 'hard' cutoff at line 120
vim.opt.colorcolumn = { 80, 120, 121 }

-- Code folding via treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- Spellchecking
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Add a custom filetype for dot_zshrc.tmpl for chezmoi
vim.filetype.add({ filename = { ["dot_zshrc"] = "zsh", ["dot_zshenv"] = "zsh", ["dot_zprofile"] = "zsh" } })

-- Command that shows the diff between the current buffer and last write
-- See ':help :DiffOrig' and https://www.reddit.com/r/neovim/comments/15ue6vh/comment/jwpbbvr/
vim.api.nvim_create_user_command('DiffOrig', function()
  local scratch_buffer = vim.api.nvim_create_buf(false, true)
  local current_ft = vim.bo.filetype
  vim.cmd('vertical sbuffer' .. scratch_buffer)
  vim.bo[scratch_buffer].filetype = current_ft
  vim.cmd('read ++edit #') -- load contents of previous buffer into scratch_buffer
  vim.cmd.normal('1G"_d_') -- delete extra newline at top of scratch_buffer without overriding register
  vim.cmd.diffthis()       -- scratch_buffer
  vim.cmd.wincmd('p')
  vim.cmd.diffthis()       -- current buffer
end, {})

-- Change diagnostic symbols
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Autocommands

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.hl.on_yank { higroup = 'DiffText', timeout = 150 }
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
