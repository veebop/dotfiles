-- Colorscheme
lvim.colorscheme = "kanagawa"

-- Map LocalLeader
vim.g.maplocalleader = "," -- Comma seems to be the most common

-- Code folding by treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Spellchecking
vim.opt.spelllang = 'en_us'

-- GUI options
vim.opt.guifont = "FiraCode Nerd Font Mono:h11"

-- Telescope
lvim.builtin.telescope.theme = "center"
lvim.builtin.which_key.mappings["sT"] = { "<cmd>Telescope<CR>", "Telescope" }

-- Zen Mode toggle
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" }

-- Rainbow Parenthesis
lvim.builtin.treesitter.rainbow.enable = true

-- Add a shortcut for inc-rename.nvim
lvim.builtin.which_key.mappings["lR"] = { "<cmd>IncRename ", "IncRename" }

-- Customize alpha
lvim.builtin.alpha.dashboard.section.footer.val[2] = ""

-- Change how telescope truncates file paths
lvim.builtin.telescope.defaults.path_display = { "Smart" }

-- Autocommands
lvim.autocommands = {
  -- Show plugin loadtime on alpha
  {
    "User",
    {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        lvim.builtin.alpha.dashboard.section.footer.val[1] = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    },
  },
}
