-- These will be overridden by auto-dark-mode.nvim, but it prevents a brief flash on startup
vim.opt.background = "dark"
vim.cmd('colorscheme bamboo')

vim.opt.backup = false                         -- Creates a backup file
vim.opt.clipboard = "unnamedplus"              -- Use the system clipboard by default
vim.opt.fileencoding = "utf-8"                 -- The encoding written to a file
vim.opt.formatoptions:remove { "l", "t", "c" } -- Don't auto wrap lines in insert mode
vim.opt.hidden = true                          -- Required to keep multiple buffers and open multiple buffers
vim.opt.ignorecase = true                      -- Ignore case in search patterns (see smartcase)
vim.opt.linebreak = true                       -- Break lines at `breakat` characters
vim.opt.mouse = "a"                            -- Allow the mouse to be used in neovim
vim.opt.path:append { "**" }
vim.opt.smartcase = true                       -- Ignore case until search contains uppercase characters
vim.opt.splitbelow = true                      -- Force all horizontal splits to go below current window
vim.opt.splitright = true                      -- Force all vertical splits to go to the right of current window
vim.opt.swapfile = false                       -- Creates a swapfile
vim.opt.textwidth = 78                         -- Set length for hard wrapping, 0 disables this
vim.opt.timeoutlen = 1000                      -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"
vim.opt.undofile = true                        -- Enable persistent undo
vim.opt.updatetime = 100                       -- Faster completion
vim.opt.wrap = false                           -- Display lines as one long line
vim.opt.writebackup = false                    -- If a file is being edited by another program it is not allowed to be edited

-- Appearance
vim.opt.cmdheight = 1             -- More space in the neovim command line for displaying messages
vim.opt.conceallevel = 0          -- Don't hide concealed text
vim.opt.cursorline = true         -- Highlight the current line
vim.opt.guifont = "monospace:h17" -- The font used in graphical neovim applications
vim.opt.hlsearch = true           -- Highlight all matches on previous search pattern
vim.opt.laststatus = 0            -- Will be enabled by lualine
vim.opt.list = true               -- Show whitespace characters (see listchars)
vim.opt.listchars = { tab = '|->', trail = '~' }
vim.opt.number = true             -- Set numbered lines
vim.opt.numberwidth = 4           -- Set number column width to 2 {default 4}
vim.opt.pumheight = 10            -- Pop up menu height
vim.opt.ruler = false             -- Lualine makes this redundant
vim.opt.scrolloff = 8             -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.showcmd = false           -- Show incomplete commands, ex: show `dt` while typing
vim.opt.showmode = false          -- Lualine makes this redundant
vim.opt.sidescrolloff = 8         -- Minimal number of screen lines to keep left and right of the cursor.
vim.opt.signcolumn = "auto:1-3"   -- Allow the sign column to grow to fit more elements
vim.opt.termguicolors = true      -- Set term gui colors (most terminals support this)
vim.opt.title = true              -- Set the title of window to the value of the titlestring

-- Tabs/indents
vim.opt.expandtab = true -- Insert spaces instead of tabs
vim.opt.shiftwidth = 2   -- Use n spaces instead of tabs for indents
vim.opt.tabstop = 8      -- Show tabs as n characters
vim.opt.softtabstop = -1 -- Insert the same number of spaces as shiftwidth when hitting tab

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
