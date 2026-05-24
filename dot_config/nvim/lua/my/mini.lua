-- Extra 'mini.nvim' functionality
require("mini.extra").setup()

-- Icon provider
require("mini.icons").setup()

----- Text editing -----

-- Extend and create a/i textobjects
local ai = require("mini.ai")
ai.setup({
  mappings = {
    around_next = "aN",
    inside_next = "iN",
    around_last = "aL",
    inside_last = "iL",
  },
  custom_textobjects = {
    -- Set `aB` / `iB` to act on whole buffer
    B = MiniExtra.gen_ai_spec.buffer(),
    D = MiniExtra.gen_ai_spec.diagnostic(),
    I = MiniExtra.gen_ai_spec.indent(),

    -- Match around/inside bar
    ["|"] = ai.gen_spec.pair("|", "|"),

    -- Treesitter textobjects
    ["?"] = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
    a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
    k = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),
    m = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    o = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),
  },
})

-- Completion and signature help
-- I'd like to switch to builtin autocomplete (vim.opt.autocomplete = true)
-- but this is nicer and simpler for now
require("mini.completion").setup({
  -- -- Effectively disable signature help display
  -- delay = { signature = 10 ^ 7 }
})
-- Advertise correct completion capabilities from mini.completion
vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })

-- Text edit operators
require("mini.operators").setup({
  exchange = { prefix = "gX" },
  replace = { prefix = "<leader>r" },
  sort = { prefix = "gS" },
})

-- Manage and expand snippets
local snippets = require("mini.snippets")
snippets.setup({
  snippets = {
    -- Global snippets from friendly-snippets
    snippets.gen_loader.from_file(vim.fn.stdpath("data") .. "/site/pack/core/opt/friendly-snippets/snippets/global.json"),
    -- Load snippets based on current language
    snippets.gen_loader.from_lang(),
  },
})

MiniSnippets.start_lsp_server()

-- Surround actions
require("mini.surround").setup({
  search_method = "cover_or_next",
})

----- General workflow -----

-- Go forward/backward with square brackets
require("mini.bracketed").setup()

-- Show next key clues
local miniclue = require("mini.clue")
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { "n", "x" }, keys = "<Leader>" },
    -- `[` and `]` keys
    { mode = "n",          keys = "[" },
    { mode = "n",          keys = "]" },
    -- Built-in completion
    { mode = "i",          keys = "<C-x>" },
    -- `g` key
    { mode = { "n", "x" }, keys = "g" },
    -- Marks
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "n", "x" }, keys = "`" },
    -- Registers
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },
    -- Window commands
    { mode = "n",          keys = "<C-w>" },
    -- `z` key
    { mode = { "n", "x" }, keys = "z" },
    { mode = { "n", "x" }, keys = "z=" },
  },

  clues = {
    {
      { mode = "n", keys = "<Leader>f",  desc = "+Find" },
      { mode = "n", keys = "<Leader>fG", desc = "+Git" },
      { mode = "n", keys = "<Leader>g",  desc = "+Git" },
      { mode = "n", keys = "<Leader>p",  desc = "+MiniPick" },
      { mode = "n", keys = "<Leader>pG", desc = "+Git" },
    },
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

-- Work with diff hunks
require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "+", change = "~", delete = "-" },
  },
  mappings = {
    apply = "gH",
    reset = "gh",
    textobject = "ih", -- "inside hunk"
  },
})

-- Navigate and manipulate file system
require("mini.files").setup({
  mappings = {
    go_in = "<S-CR>",    -- Normal enter
    go_in_plus = "<CR>", -- Enter and close window
    go_out = "-",
    go_out_plus = "",
  },
  options = {
    use_as_default_explorer = false,
  },
  windows = {
    preview = true,
    width_preview = 80,
  },
})

-- Git integration
require("mini.git").setup()

-- Miscellaneous useful functions
require("mini.misc").setup()

-- Pick anything
require("mini.pick").setup({
  mappings = {
    mark_all = "<C-A>",
  },
})

----- Appearance -----

-- Automatic highlighting of word under cursor
require("mini.cursorword").setup()

-- Highlight patterns in text
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    -- Highlight standalone "FIXME", "WARN", "HACK", "TODO", "NOTE"
    fixme     = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    warn      = { pattern = "%f[%w]()WARN()%f[%W]", group = "@comment.warning" },
    hack      = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo      = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note      = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- Minimal and fast statusline module with opinionated default look
require("mini.statusline").setup()

-- Minimal and fast tabline showing listed buffers
require("mini.tabline").setup({
  -- Show buf_id and add a "+" to changed files
  format = function(buf_id, label)
    local edited = vim.bo[buf_id].modified and "+ " or ""
    return MiniTabline.default_format(buf_id, label) .. edited
  end,
  -- Show current tab on the right
  tabpage_section = "right",
})
