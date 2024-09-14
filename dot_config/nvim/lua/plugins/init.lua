-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
        "gopls",
        "jdtls",
        "jsonls",
        "ltex",
        "lua_ls",
        "marksman",
        "pylsp",
        "rust_analyzer",
        "taplo",
        "texlab",
        "ts_ls",
        "vale_ls",
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
      ensure_installed = { "codespell", "yapf", },
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
    "aznhe21/actions-preview.nvim",
    lazy = true,
  },
  {
    "smjonas/inc-rename.nvim",
    opts = {},
    event = "LspAttach",
  },
  {
    "j-hui/fidget.nvim",
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
    build = "make install_jsregexp",
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
    config = require("plugins/nvim-dap").setup,
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      mode = 'topline',
    },
    event = { "BufRead", "BufNewFile" },
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
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        before = "",
        keyword = "fg",
        after = "",
      },
    },
    cmd = { "TodoLocList", "TodoTrouble", "TodoQuickFix", "TodoTelescope" },
    event = { "BufRead", "BufNewFile" },
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
  {
    "kylechui/nvim-surround",
    opts = {},
    event = { "BufRead", "BufNewFile" },
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  -- Navigation
  {
    -- NOTE: Consider using "idanarye/nvim-impairative" instead
    "afreakk/unimpaired-which-key.nvim",
    dependencies = { "tpope/vim-unimpaired" },
    config = function()
      local wk = require("which-key")
      wk.add(require("unimpaired-which-key"))
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
      require("telescope").load_extension("undo")
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
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
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
      require("project_nvim").setup({
        manual_mode = true,
        show_hidden = true,
        silent_chdir = false,
      })
      require("telescope").load_extension('projects')
    end,
    event = "VeryLazy",
    cmd = "Telescope projects",
  },
  {
    "uga-rosa/ccc.nvim",
    opts = {
      highlighter = {
        auto_enable = true,
      },
    },
    event = { "BufRead", "BufNewFile" },
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
      options = {
        transparent = true,
        styles = {
          comments = "italic",
        },
      },
      groups = {
        dayfox = {
          Whitespace = { link = "NonText" },
          IblWhitespace = { link = "NonText" },
        }
      },
    },
    priority = 1000,
    lazy = false,
  },
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = { "bamboo.nvim", "nightfox.nvim" },
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd('colorscheme bamboo')
      end,
      set_light_mode = function()
        vim.opt.background = "light"
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
      vim.g.vimtex_syntax_enabled = 0
    end,
    lazy = false,
  },
  -- Simple LaTeX rendering in the terminal
  {
    "jbyuki/nabla.nvim",
    lazy = true
  },
  ----- LANGUAGE SPECIFIC -----
  -- Rust
  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
  },
  {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      null_ls = { enabled = true, name = "Crates" },
    },
    event = { "BufRead Cargo.toml" },
  },
  -- C/C++
  {
    "p00f/clangd_extensions.nvim",
    opts = {},
    event = "VeryLazy",
  },
  -- Lua
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "wezterm-types", mods = { "wezterm" } },
      }
    },
  },
  { "justinsgithub/wezterm-types", lazy = true, }, -- Wezterm types for lazydev
})
