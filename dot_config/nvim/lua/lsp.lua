-- LSP configurations

-- ltex
vim.lsp.config('ltex', {
  settings = {
    ltex = {
      disabledRules = {
        ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
      },
    },
  },
})

-- lua
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        -- Disable the noisy "missing-fields" warnings
        disable = { "missing-fields" },
      },
    },
  },
})

-- tinymist
vim.lsp.config('tinymist', {
  settings = {
    formatterMode = 'typstyle',
    formatterProseWrap = true,
    formatterPrintWidth = 79,
  }
})
