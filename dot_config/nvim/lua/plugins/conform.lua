local M = {}

function M.setup()
  require("conform").setup({
    -- Formatters
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shfmt" },
      -- Web
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      -- Run on all filetypes
      -- ["*"] = { "example_formatter_here" },
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
        start = { args.line1, 0 }, ["end"] = { args.line2, end_line:len() }, }
    end
    require("conform").format({ async = true, range = range })
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
    })
  vim.api.nvim_create_user_command("FormatDisable",
    function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
  vim.api.nvim_create_user_command("FormatEnable",
    function(args)
      if args.bang then
        vim.b.disable_autoformat = false
      else
        vim.g.disable_autoformat = false
      end
    end, {
      desc = "Re-enable autoformat-on-save",
      bang = true,
    })

  -- Disable autoformat by default
  vim.g.disable_autoformat = true
end

return M
