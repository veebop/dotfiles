--@type vim.lsp.Config
return {
  --@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      workspace = {
        ignoreSubmodules = true,
        library = vim.api.nvim_get_runtime_file("", true),
        -- library = { vim.env.VIMRUNTIME, },
      },
      telemetry = { enable = false },
    },
  },
}
