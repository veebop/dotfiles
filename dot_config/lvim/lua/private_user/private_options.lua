-- Colorscheme
lvim.colorscheme = "kanagawa"

-- Map LocalLeader
vim.g.maplocalleader = "," -- Comma seems to be the most common

-- Adjust what is shown with which-key.nvim
lvim.builtin.which_key.setup.plugins = {
  marks = true,     -- shows a list of your marks on ' and `
  registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  -- the presets plugin, adds help for a bunch of default keybindings in Neovim
  -- No actual key bindings are created
  spelling = {
    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    suggestions = 20, -- how many suggestions should be shown in the list?
  },
  presets = {
    operators = true,    -- adds help for operators like d, y, ...
    motions = true,      -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = true,      -- default bindings on <c-w>
    nav = true,          -- misc bindings to work with windows
    z = true,            -- bindings for folds, spelling and others prefixed with z
    g = true,            -- bindings for prefixed with g
  },
}

-- Code folding by treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Enable formatting on save, otherwise I will always forget
lvim.format_on_save = true

-- Spellchecking
vim.opt.spelllang = 'en_us'

-- GUI options
vim.opt.guifont = "FiraCode Nerd Font Mono:h11"

-- Lualine theme
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_c = {
  {
    'filename',
    file_status = true,
    newfile_status = true,
    path = 1,
  }
}
lvim.builtin.lualine.sections.lualine_x = {
  'encoding', {
  'fileformat',
  icons_enabled = false,
},
  'filetype'
}

-- Move text up and down
-- Visual --
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Visual Block --
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- Telescope
lvim.builtin.telescope.theme = "center"
lvim.builtin.which_key.mappings["sT"] = { "<cmd>Telescope<CR>", "Telescope" }

-- Enable preview for finding files
lvim.builtin.which_key.mappings["f"] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files { previewer = true }
  end,
  "Find File"
}

-- Zen Mode toggle
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" }

-- Rainbow Parenthesis
lvim.builtin.treesitter.rainbow.enable = true

-- Add a shortcut for inc-rename.nvim
lvim.builtin.which_key.mappings["lR"] = { "IncRename" } -- Name that appears in which-key
lvim.keys.normal_mode["<leader>lR"] = ":IncRename "

-- Enable completion for the command line
lvim.builtin.cmp.cmdline.enable = true

-- (Effectively) How fast which_key opens
vim.o.timeoutlen = 500

-- Shortcuts for Neorg
lvim.builtin.which_key.mappings["n"] =
{
  name = "Neorg",
  n = { "<cmd>Neorg workspace notes<CR>", "Open notes" },
  t = { "<cmd>Neorg journal today<CR>", "Open today's journal" },
  j = { "<cmd>Neorg journal<CR>", "Journal" },
  i = { "<cmd>Neorg index<CR>", "Open index" },
}

-- Shortcut for nabla (LaTeX)
lvim.builtin.which_key.mappings["T"] = {
  name = "LaTeX",
  T = { "<cmd>lua require'nabla'.toggle_virt()<CR>", "Toggle Nabla" },
  p = { "<cmd>lua require'nabla'.popup()<CR>", "Nabla Popup" },
}

-- Change how telescope truncates file paths
lvim.builtin.telescope.defaults.path_display = { "Smart" }
