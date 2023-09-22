return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
              return false
            end
            return true
          end,
        },
        { name = "path" },
        { name = "luasnip" },
        { name = "cmp_tabnine" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
        { name = "crates" },
        { name = "tmux" },
      })
    })
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "saadparwaiz1/cmp_luasnip", lazy = true },
    { "hrsh7th/cmp-nvim-lsp",     lazy = true },
    { "hrsh7th/cmp-buffer",       lazy = true },
    { "hrsh7th/cmp-path",         lazy = true },
    { "hrsh7th/cmp-cmdline",      lazy = true },
  }
}
