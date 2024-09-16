local M = {}

function M.setup_lspconfig()
  require("mason").setup()
  require("mason-lspconfig").setup()

  -- Setup language servers installed via Mason
  -- See nvim-lspconfig.lua for other language servers
  require("mason-lspconfig").setup_handlers {
    -- Default handler for servers without a dedicated handler
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,
    -- Overrides for specific servers
    ["ltex"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.ltex.setup {
        settings = {
          ltex = {
            disabledRules = {
              ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
            },
          },
        },
      }
    end,
    ["rust_analyzer"] = function()
      -- This is handled via rustaceanvim
    end,
    ["vale_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.vale_ls.setup {
        init_options = {
          configPath = vim.fn.expand("~/.config/vale/.vale.ini"),
        },
        filetypes = { "markdown", "text", "tex", },
      }
    end,
  }
end

return M
