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
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim" },
    config = require("plugins.none-ls").setup,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "jdtls",
        "jsonls",
        "ltex",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "taplo",
        "texlab",
        "tsserver",
        "yamlls",
        "zls",
      },
    },
    lazy = true,
    cmd = { "LspInstall", "LspUninstall" },
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "mason.nvim",
      "none-ls.nvim",
    },
    opts = {
      ensure_installed = { "alex", "codespell", "clang-format", "proselint", "yapf", "write-good" },
    },
    cmd = { "NullLsInstall", "NullLsUninstall" },
    event = { "BufReadPre", "BufNewFile" },
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
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
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
      { "micangl/cmp-vimtex",       lazy = true },
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
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = "nvim-dap-ui",
    config = require("plugins/nvim-dap").setup,
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    lazy = true,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = true,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "codelldb" },
      handlers = {},
    },
    cmd = { "DapInstall", "DapUninstall" },
    lazy = true,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = require('plugins.nvim-treesitter').setup,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
  },
  -- Editing
  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = { "BufRead", "BufNewFile" },
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
    event = "VeryLazy",
  },
  -- Utilities
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require('telescope').setup {}
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('media_files')
    end,
    event = "VeryLazy",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', },
    lazy = true,
  },
  {
    "folke/which-key.nvim",
    opts = {},
    cmd = "WhichKey",
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    event = { "BufRead", "BufNewFile" },
    cmd = "Gitsigns",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = require("plugins.nvim-tree").setup,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
      require("telescope").load_extension('projects')
    end,
    event = "VeryLazy",
    cmd = "Telescope projects",
  },
  {
    "andrewferrier/wrapping.nvim",
    opts = {},
    event = { "FileReadPre", "BufReadPre", "BufRead" },
  },
  {
    "uga-rosa/ccc.nvim",
    opt = {},
    event = { "BufRead", "BufNewFile" },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes",
      debug = false,
      disable_extra_info = 'no',
      prompts = {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
      }
    },
    build = function()
      vim.cmd("UpdateRemotePlugins")
    end,
    cmd = { "CopilotChatExplain", "CopilotChatReview", "CopilotChatTests", "CopilotChatRefactor" }
  },
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  {
    "LunarVim/bigfile.nvim",
    opts = {},
    event = { "FileReadPre", "BufReadPre", "BufRead" },
  },
  -- Aesthetics
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      transparent = true,
    },
    priority = 1000,
    lazy = false,
  },
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = { "bamboo.nvim", "nightfox.nvim" },
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd('colorscheme bamboo')
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd('colorscheme dayfox')
      end,
    },
    lazy = false,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "auto-dark-mode.nvim" },
    config = require('plugins.alpha-nvim').setup,
    lazy = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins.lualine").setup,
    event = { "BufReadPre", "BufRead", "BufNewFile" },
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      lsp = {
        auto_attach = true,
        preference = { "clangd", "sourcekit" },
      }
    },
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = require("plugins.bufferline").setup,
    event = { "BufRead", "BufNewFile" },
  },
  {
    "tiagovla/scope.nvim",
    opts = {},
    event = { "BufRead", "BufNewFile" },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'dirbuf',
          'dirvish',
          'fugitive',
          'alpha',
          'NvimTree',
          'lazy',
          'NvimTree',
          'TelescopePrompt',
        },
      })
    end,
    event = { "BufRead", "BufNewFile" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
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
  ----- NOTE TAKING
  -- Neorg
  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim", "laher/neorg-exec" },
    build = ":Neorg sync-parsers",
    config = require("plugins.neorg").setup,
    ft = "norg",
    cmd = "Neorg",
  },
  -- Markdown zettelkasten
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim' },
    opts = { home = vim.fn.expand("~/Documents/Markdown/Notes") },
    ft = "markdown",
    cmd = "Telekasten",
  },
  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  },
  -- Run code snippets inside notes!
  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh install.sh",
    opts = {
      display = { "Terminal" },
      display_options = {
        terminal_scrollback = vim.o.scrollback,
        terminal_line_number = false,
        terminal_signcolumn = false,
        terminal_position = "vertical",
        terminal_width = 45,
        terminal_height = 20,
      },
    },
    event = { "VeryLazy" },
    -- TODO: The "cmd" lazy load triggers are currently unused. Need to change <Plug>SnipRunOperator to lazy load.
    cmd = {
      "SnipRun",
      "SnipInfo",
      "SnipReset",
      "SnipReplMemoryClean",
      "SnipClose",
      "SnipLive",
    },
  },
  -- Preview markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  },
  -- LaTeX tools (highlighting, preview, etc.)
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "sioyek"
    end,
    lazy = false,
  },
  -- Simple LaTeX rendering in the terminal
  {
    "jbyuki/nabla.nvim",
    lazy = true
  },
  -- Calendar
  {
    'renerocksai/calendar-vim',
    init = function()
      vim.g.calendar_no_mappings = 1
    end,
    lazy = true,
  },
  ----- LANGUAGE SPECIFIC -----
  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^3',
    ft = { 'rust' },
  },
  {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      src = { cmp = { enabled = true, }, },
      null_ls = { enabled = true, name = "Crates" },
    },
    event = { "BufRead Cargo.toml" },
  },
})
