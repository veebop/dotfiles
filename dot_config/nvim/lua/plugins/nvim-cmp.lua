local M = {}

local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

function M.setup()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- Mostly lifted from AstroNvim
      ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ['<C-y'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- elseif luasnip.expand_or_jumpable() then
          --   luasnip.expand_or_jump()
          -- elseif has_words_before() then
          --   cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
          -- elseif luasnip.jumpable(-1) then
          --   luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),

    sources = cmp.config.sources({
      { name = 'vimtex',                priority = 1050, filetype = { "tex", "bib" } },
      { name = 'lazydev',               priority = 1050, filetype = { "lua" } },
      { name = 'vim-dadbod-completion', priority = 1050, filetype = { "sql", "mysql", "plsql" } },
      { name = 'nvim_lsp',              priority = 1000 },
      { name = 'luasnip',               priority = 950 },
      { name = 'buffer',                priority = 500 },
      { name = 'path',                  priority = 250 },
    })
  })

  -- Search sources
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer', priority = 1000 }
    }
  })

  -- Cmdline sources
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path',    priority = 1000 },
      { name = 'cmdline', priority = 500 },
    })
  })
end

return M
