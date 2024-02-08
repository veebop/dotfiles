local M = {}

function M.setup()
  local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed
      }
    end
  end

  -- My extensions
  -- Usually based off of built in extensions, but in the winbar instead
  local nvim_dap_ui = {
    winbar = {
      lualine_a = { { 'filename', file_status = false } },
    },
    filetypes = {
      'dapui_console',
      'dapui_watches',
      'dapui_stacks',
      'dapui_breakpoints',
      'dapui_scopes',
    },
  }

  local nvim_dap_ui_repl = {
    winbar = {
      lualine_a = { "string.format('DAP Repl')" },
      lualine_b = {
        { "string.format(' ')", on_click = function() require('dap').continue() end },
        { "string.format(' ')", on_click = function() require('dap').step_into() end },
        { "string.format(' ')", on_click = function() require('dap').step_over() end },
        { "string.format(' ')", on_click = function() require('dap').step_out() end },
        { "string.format(' ')", on_click = function() require('dap').step_back() end },
        { "string.format(' ')", on_click = function() require('dap').run_last() end },
        { "string.format(' ')", on_click = function() require('dap').terminate() end },
        { "string.format(' ')", on_click = function() require('dap').disconnect() end },
      },
    },
    inactive_winbar = {
      lualine_a = { "string.format('DAP Repl ')", },
      lualine_b = {
        { "string.format(' ')", on_click = function() require('dap').continue() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').step_into() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').step_over() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').step_out() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').step_back() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').run_last() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').terminate() end, separator = " ", },
        { "string.format(' ')", on_click = function() require('dap').disconnect() end, separator = " ", },
      },
    },
    filetypes = {
      'dap-repl',
    },
  }

  require('lualine').setup({
    options = {
      disabled_filetypes = {
        'alpha',
        'NvimTree',
        -- These are handled by extensions
        winbar = {
          'mason',
          'lazy',
        },
        statusline = {
          'dap-repl',
          'dapui_console',
          'dapui_watches',
          'dapui_stacks',
          'dapui_breakpoints',
          'dapui_scopes',
        },
      },
    },

    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        { 'b:gitsigns_head', icon = '' },
        { 'diff', diff = diff_source() },
        'diagnostics',
      },
      lualine_c = {
        {
          'filename',
          file_status = true,
          newfile_status = true,
          path = 3,
        }
      },
      lualine_x = {
        'encoding',
        { 'fileformat', icons_enabled = false, },
        'filetype',
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },

    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        {
          'filename',
          path = 1,
        },
        { 'diagnostics' },
        { 'location' },
      },
      lualine_y = {},
      lualine_z = {},
    },

    winbar = {
      lualine_a = { "filename" },
      lualine_b = { "navic" },
      lualine_c = { "searchcount", "selectioncount" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    inactive_winbar = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    extensions = { 'lazy', 'mason', nvim_dap_ui, nvim_dap_ui_repl }
  })
end

return M
