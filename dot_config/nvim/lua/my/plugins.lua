-- Hook to run when a plugin is installed, updated, or deleted
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    -- Update treesitter parsers on plugin install/update
    if name == "nvim-treesitter" and (kind == "update") then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end
})

-- Install plugins
vim.pack.add({
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/ribru17/bamboo.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
})

-- Color schemes
require("nightfox").setup({
  options = {
    transparent = true,
    styles = {
      comments = "italic",
    },
  },
})

require("bamboo").setup({
  transparent = true,
})

local function set_bg(ev)
  if vim.o.background == "dark" then
    vim.cmd("colorscheme bamboo")
  else
    vim.cmd("colorscheme dayfox")
  end
  vim.cmd("redraw")
end

-- Set colorscheme at start of session
set_bg()

-- Update colorscheme when background changes
vim.api.nvim_create_autocmd({ "OptionSet" }, {
  pattern = { "background" },
  callback = set_bg,
})

-- mini.nvim
require("my.mini")

-- snacks.nvim
require("my.snacks")

-- Formatting
require("conform").setup({
  -- Formatters
  formatters_by_ft = {
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports", lsp_format = "last" },
    zig = { "zigfmt", lsp_format = "never" },
    -- Web
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    -- Run on filetypes without an explicit configuration
    ["_"] = { "trim_newlines", "trim_whitespace", lsp_format = "last" },
  },

  -- Format options
  default_format_opts = {
    -- Only run the lsp formatter if another is not specified
    lsp_format = "fallback",
  },

  -- Format on save
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, }
  end,
})


-- Command to run async formatting
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Commands to enable/disable formatting
vim.api.nvim_create_user_command("FormatToggle",
  function(args)
    if args.bang then
      vim.b.disable_autoformat = not vim.b.disable_autoformat
      print("vim.b.disable_autoformat set to " .. tostring(vim.b.disable_autoformat))
    else
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      print("vim.g.disable_autoformat set to " .. tostring(vim.g.disable_autoformat))
    end
  end,
  {
    desc = "Toggle autoformat-on-save",
    bang = true,
  }
)
vim.api.nvim_create_user_command("FormatDisable",
  function(args)
    if args.bang then
      -- FormatDisable! will disable formatting just for this buffer
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end,
  {
    desc = "Disable autoformat-on-save",
    bang = true,
  }
)
vim.api.nvim_create_user_command("FormatEnable",
  function(args)
    if args.bang then
      vim.b.disable_autoformat = false
    else
      vim.g.disable_autoformat = false
    end
  end,
  {
    desc = "Re-enable autoformat-on-save",
    bang = true,
  }
)

-- Disable autoformat by default
vim.g.disable_autoformat = true

-- Mason for lsp/formatter/linter management
require("mason").setup()
