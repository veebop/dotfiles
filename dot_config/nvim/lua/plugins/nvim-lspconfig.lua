local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- Language Servers
  lspconfig.bashls.setup {}
  -- Temp (?) fix for the 'multiple offset-encodings' warning for clangd
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.offsetEncoding = 'utf-16'
  lspconfig.clangd.setup {
    capabilities = capabilities,
  }
  lspconfig.cmake.setup {}
  lspconfig.gopls.setup {}
  lspconfig.jdtls.setup {}
  lspconfig.jsonls.setup {}
  lspconfig.ltex.setup {
    settings = {
      ltex = {
        disabledRules = {
          ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
        },
      },
    },
  }
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = "Disable",
        }
      }
    }
  }
  lspconfig.marksman.setup {}
  lspconfig.pylsp.setup {}
  -- Rust is configured via rust-tools
  lspconfig.sourcekit.setup {
    -- I don't want sourcekit to do lsp for c/cpp files
    filetypes = { "swift", "objective-c", "objective-cpp" },
  }
  lspconfig.texlab.setup {}
  lspconfig.taplo.setup {}
  lspconfig.ts_ls.setup {}
  lspconfig.vale_ls.setup {
    init_options = {
      configPath = vim.fn.expand("~/.config/vale/.vale.ini"),
    },
    filetypes = { "markdown", "text", "tex", },
  }
  lspconfig.yamlls.setup {}
  lspconfig.zls.setup {}
end

return M
