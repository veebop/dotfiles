local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = require("plugins.nvim-lspconfig").setup,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {},
    lazy = true,
    cmd = { "LspInstall", "LspUninstall" },
    event = "User FileOpened",
  },
  {
    "williamboman/mason.nvim",
    opts = {},
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
    lazy = true,
    event = "User FileOpened",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    opts = {},
    event = "LspAttach",
  },
  -- Completions
  {
    "hrsh7th/nvim-cmp",
    config = require('plugins.nvim-cmp').setup,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp",     lazy = true },
      { "hrsh7th/cmp-buffer",       lazy = true },
      { "hrsh7th/cmp-path",         lazy = true },
      { "hrsh7th/cmp-cmdline",      lazy = true },
      { "saadparwaiz1/cmp_luasnip", lazy = true },
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "sar/friendly-snippets.nvim", lazy = true },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    event = "InsertEnter",
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = "nvim-dap-ui",
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    lazy = true,
  },
  -- Formatting/Linting
  {
    "mhartington/formatter.nvim",
    config = require("plugins.formatter").setup,
    event = { "User FileOpened" },
  },
  {
    "mfussenegger/nvim-lint",
    config = require("plugins.nvim-lint").setup,
    event = { "User FileOpened" },
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "User FileOpened",
  },
  -- Editing
  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true -- Loaded by Comment.nvim pre_hook
  },
  {
    "windwp/nvim-autopairs",
    dependencies = {
      "nvim-treesitter",
      "nvim-cmp",
    },
    opts = {},
    event = "InsertEnter",
  },
  -- Navigation
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  -- Utilities
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
  {
    "folke/which-key.nvim",
    opts = {},
    cmd = "WhichKey",
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = require("plugins.nvim-tree").setup,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
    event = "User FileOpened",
    cmd = "Gitsigns",
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    cmd = "Telescope projects",
  },
  {
    "folke/neodev.nvim",
    setup = true,
    lazy = true,
  },
  {
    "LunarVim/bigfile.nvim",
    opts = {},
    event = { "FileReadPre", "BufReadPre", "User FileOpened" },
  },
  -- Aesthetics
  {
    "rebelot/kanagawa.nvim",
    opts = { transparent = true },
  },
  {
    "goolord/alpha-nvim",
    config = require('plugins.alpha-nvim').setup,
    event = "VimEnter",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins.lualine").setup,
    event = "VimEnter",
  },
  {
    "SmiteshP/nvim-navic",
    opts = { lsp = { auto_attach = true } },
    event = "User FileOpened",
  },
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup()
    end,
    event = "User FileOpened",
  },
  {
    "RRethy/vim-illuminate",
    event = "User FileOpened",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = require("plugins.indent-blankline").setup,
    event = "User FileOpened",
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufRead",
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = { backdrop = 0.95, width = 120, height = 1, },
      plugins = {
        tmux = { enabled = true }, -- disables tmux statusline
        -- kitty options: "allow_remote_control socket-only" "listen_on unix:/tmp/kitty"
        kitty = { enabled = true, font = "+4", },
        wezterm = { enabled = true, font = "+2", },
      },
    },
    cmd = "ZenMode"
  },
  -- Neorg
  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = ":Neorg sync-parsers",
    config = require("plugins.neorg").setup,
    ft = "norg",
    cmd = "Neorg",
  },
  -- Rust
  {
    "simrat39/rust-tools.nvim",
    config = require("plugins.rust-tools").setup,
    event = { "BufRead *.rs" },
  },
  {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = { "BufRead Cargo.toml" },
  }
})
