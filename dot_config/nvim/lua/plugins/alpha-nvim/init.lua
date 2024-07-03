local M = {}

function M.setup()
  local alpha = require('alpha')
  local dashboard = require('alpha.themes.dashboard')
  local header = dashboard.section.header
  local buttons = dashboard.section.buttons
  local footer = dashboard.section.footer
  header.type = 'text'
  header.val = function()
    local alpha_wins = vim.tbl_filter(function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      return vim.api.nvim_get_option_value("filetype", { buf = buf })
    end, vim.api.nvim_list_wins())

    if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) > 75 then
      return require("plugins/alpha-nvim/headers").get_large_header()
    elseif vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) > 40 then
      return require("plugins/alpha-nvim/headers").get_medium_header()
    else
      return require("plugins/alpha-nvim/headers").get_small_header()
    end
  end
  header.opts = {
    position = "center",
    hl = "Error",
  }


  buttons.val = {
    dashboard.button('', ''),
  }
  for _, button in ipairs(buttons.val) do
    button.opts.hl = 'AlphaButtons'
    button.opts.hl_shortcut = 'function'
    button.opts.position = "center"
    button.opts.width = 1
  end

  footer.opts = {
    hl = "String",
    position = "center",
  }
  dashboard.section.type = "group"
  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      callback = function()
        require('lazy').show()
      end,
    })
  end

  vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyVimStarted',
    callback = function()
      local stats = require('lazy').stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local platform = function()
        if vim.loop.os_uname().sysname == "Darwin" then
          return " "
        elseif vim.fn.has('linux') then
          return " "
        elseif vim.fn.has('win32') then
          return " "
        else
          return "? "
        end
      end
      local v = vim.version()
      local datetime = os.date " %m-%d-%Y   %H:%M:%S"
      local pad_string = require("utils").pad_string
      local max_width = 50
      local tbl = {
        pad_string(stats.count .. ' plugins loaded in ' .. ms .. "ms", max_width, "center"),
        pad_string(string.format("%s", datetime), max_width, "center", 2),
        pad_string(string.format("%s Neovim Version %d.%d.%d", platform(), v.major, v.minor, v.patch), max_width,
          "center", 1),
      }
      footer.val = tbl
      pcall(vim.cmd.AlphaRedraw)
    end,
  })


  alpha.setup(dashboard.config)
end

return M
