return {
  {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" },
    { "folke/neodev.nvim", lazy = true },
    { "RRethy/vim-illuminate", event = "User FileOpened" },
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip" },
    { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  },
  config = function()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    config = function()
      require("mason-lspconfig").setup()
    end,
    lazy = true,
    event = "User FileOpened",
    dependencies = "mason.nvim"
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
    event = "User FileOpened",
    lazy = true,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = true,
    config = function()
      require("mason-nvim-dap").setup()
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        handlers = {},
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = { "rcarriga/nvim-dap-ui" },
  }
}
