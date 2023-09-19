-- Addtional Plugins
lvim.plugins = {
  -- AESTHETIC --
  -- Theme
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true,
      })
    end
  },
  -- Adds rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
  },
  -- Adds a zen mode
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
  },
  -- Automatic switching between light and dark mode. Requires external program
  {
    "SyedFasiuddin/theme-toggle-nvim",
    config = function()
      require('theme-toggle-nvim').setup({
        colorscheme = {
          light = "kanagawa-wave",
          dark = "kanagawa-wave",
        }
      })
    end
  },
  -- NAVIGATION --
  -- Faster navigation using symbols
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  -- LSP --
  -- Adds the ability to incrementally rename variables
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
    event = "BufRead",
  },
  -- Show progress while lsp loads
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    event = "LspAttach",
    config = function()
      require("fidget").setup()
    end,
  },
  -- GIT --
  -- A more complete diff view
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- NOTES --
  -- Notes/Organization system
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "norg",
    cmd = "Neorg",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/Neorg/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {},
        },
      }
    end,
  },
  -- Adds LaTeX rendering using Unicode characters and ASCII art like representation.
  {
    "jbyuki/nabla.nvim",
    lazy = true,
  },
  -- RUST --
  -- Additional support for rust
  {
    "simrat39/rust-tools.nvim",
    event = { "BufRead *.rs" },
  },
  -- Better handling of rust crates
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = { enabled = true, name = "crates.nvim", },
        popup = { border = "rounded", },
      }
    end,
  },
}
