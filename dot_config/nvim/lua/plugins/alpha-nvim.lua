local M = {}

M.setup = function()
  local alpha = require('alpha')
  local dashboard = require('alpha.themes.dashboard')
  local small_header = {
    "⣿⣿⠉⠁    ⡿⣉⠛ ⢨⣿⣿⡏   ⡟⣛⣿⣻⣿⠟⢉⣤⣺⢻⣻⡏ ⡿⠻⢻⣿⢿⠻⡟⢳⢶⣄      ⢠⠿⢭⡛⠁⡆     ⢘⡻⣟⡏   ⢀⡞⣛⡟⠟⠉ ⠟⣿⡿⠁ ⠙⠿⣻⠁       ⠿⣟⣻⠁",
    "⣿⣡⣘     ⡻⡿⠙ ⢸⣿⣿⡅   ⠛⠚⠛⠋⢀⡴⣿⡟⠋⠛⠛⠃ ⣟⣆⣨⠓⠛⠛⠓⠻⣿⡟⡅     ⣾⡖⣿⠂⣸⣧     ⢰⣿⣽⡇  ⣠⣿⣝⣿⠉   ⣀⠸⣼  ⣾⣿⣿        ⠺⣷⣿",
    "⣽⣾⣿     ⣿⣷⣿ ⢸⣿⣿⡇       ⢸⣿⣿⡇     ⣿⣻⣽    ⢰⣟⣻⡇    ⣸⣷⣿⡎⢠⣿⣿⣇    ⢸⣿⣿⡇ ⠰⠿⣿⡟     ⡏⠉⣹  ⣿⣿⣿        ⣷⣿⣿",
    "⣿⣿⣿     ⣿⣿⣿ ⢸⣿⣿⡇       ⢸⣽⣿⡇     ⣿⣿⣿⣶⣶⣶⣾⣿⡿⠋    ⢠⣿⣿⡿  ⢹⣿⣿⡄   ⢸⣿⣿⡇⢰⣶⣦⠈      ⣿⣯⣿  ⣿⣿⣿        ⣿⣿⣿",
    "⣿⣿⣿     ⣿⣿⣿ ⢸⣿⣿⡇       ⢸⣿⣿⡇     ⣿⣿⣿⠛⠛⠛⠻⣿⣿⣷⡄   ⣾⣿⣿⢃⣀⣀ ⢿⣿⣷   ⢸⣿⣿⡇⠸⢿⣿⣷⡄     ⣿⡿⣿  ⠙⢿⣿        ⣿⣿⣿",
    "⢻⣿⣿⣄   ⢠⣿⣿⡟ ⢸⣿⣿⡇       ⢸⣿⣿⡇     ⣿⣿⣿    ⢈⣿⣿⡇  ⣸⣿⣿⣿⣿⣿⣿⡄⠘⣿⣿⣇  ⢸⣿⣿⡇ ⠈⢻⣿⣿⣆    ⣧⣄⣼  ⣷⣄⠙        ⣿⣿⣿",
    " ⠻⣿⣿⣷⣶⣶⣿⣿⡿⠁ ⢸⣿⣿⣷⣶⣶⣶⣶⣶⣶⠂⢸⣿⣿⡇     ⣿⣿⣿    ⢸⣿⣿⡇ ⢠⣿⣿⡿⠁     ⢹⣿⣿⡄ ⢸⣿⣿⡇   ⠻⣿⣿⣷⡀  ⣿⣿⣿  ⣿⣿⣷⣄⠒⢶⣶⣶⣶⡖ ⣿⣿⣿⣶⣶⡶⠒⣢⣴⡖",
    "  ⠈⠛⠿⠿⠿⠟⠋   ⠸⠿⠿⠿⠿⠿⠿⠿⠿⠿ ⠸⠿⠿⠇     ⠿⠿⠿    ⢸⠿⠿⠇ ⠾⠿⠿⠃       ⠿⠿⠷ ⠸⠿⠿⠇    ⠙⠿⠿⠿⢄ ⠿⠿⠿  ⠿⠿⠿⠿⠷⢄⠙⠿⠿⠇ ⠿⠿⠿⠟⢁⠤⠾⠿⠿⠇",
  }
  local large_header = {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⠛⠿⢿⣩⡄⣿⣿⠿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣏⣄⡻⣿⣿⠸⣿⡇⣶⣿⣿⣿⡟⠛⣫⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⢿⡿⡿⣿⡿⣿⡿⣷⠘⠿ ⠉⠁⠿⡻⠟⣫⣴⣀⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣿⡇⡘⣿⣿⣿⣿⡿⣻⠇⢠⡆⣿⣿⣿⣿⣿⣿⠿⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣶⣖⣢⣄⡬⢁⣉⠉⠁⠁      ⠉⠉⠛⠛⠛⢻⡿⡿⠿⢿⠿⣿⣿⣆⠘⣿⣿⢡⠹⣿⡟⠫⠾⠁⣠⣿⣹⣿⣿⠿⢛⡩ ⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⡶⠅   ⠐⠤⣀⣀⣀     ⠠⢀ ⣐⠉⠙⠛⢂⠌⠟⢋ ⢹⣿⣏ ⣰⠦⠄⠊⣁⠴⡾⢁⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⢿⣯⠖⣡⣾⣶⣠⣤⠠⣼⣿⣿⣿⣿⣾⣾⣤⣶⣾⣿⣿⣷⣴⠊⠁  ⠂⠠⡙⠟⢁⠬  ⠘⢉⣃⣠⣶⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⡯⠌⢡⣿⣿⣿⡇⣿⣿⣧⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⠁   ⠐⠸ ⡅⡩⠃⠡ ⢀⣾⠿⡿⠿⢛⣛⠍⠉⢀⣀⣤⣴⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⠟⢰⣿⣿⣿⣊⢩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢅⡀  ⢠⣕⣐⡮⠾⠂  ⢀ ⢁  ⣚⣩⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣧⣶⣾⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⠂ ⣠⡇⠁⠋  ⠠  ⠈⢰⠈⠐⠛⢛⠿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠾⠛⠓⡄ ⠠⠠⠈  ⢰⠦   ⠙⢿⠌⠎⡇⣿⡟⣿⣿⣿⣿⣿⣿⣿⣽⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁   ⡐⠆⢄⢬⡄  ⢰⠧⡀ ⠁⣼⡆⠘⡂ ⠈⢻⡼⢳⠿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋ ⠊   ⢀ ⠰⠔⠊⠊⠡⠔⠢⠴⠆ ⢿⣦ ⠈⢿⡇⡰⠃  ⢣⢋⣼⣿⣿⣿⣿⣿⣯⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠁⠘⠛⠟⠙⠁   ⡀⠄⠂⠈          ⢀⡨⢺⣿⣷⡄⠈⣇⠮⣄⡀  ⠻⣿⠿⠟⠸⠿⣿⣿⣿",
    "⣿⣿⣿⣿⡿⠘⣻⣿⣿⣿⣿⣿⡿⠋    ⢠⣀⣀⣀⡀⠠⠐      ⡀⢀⢤⣄  ⢀⣠⣶⣿⡅⢸⣿⣿⣿⢦⣜⣿⣿⣿⣦⡀ ⢋⡀⡻⠘⠸⠿⠏⣿",
    "⣿⣿⣿⣿⣿⣧⢻⣿⡟⠈⠛⠉  ⣠⣴⣶⣿⣿⣿⣿⣿⡏ ⠄ ⠐⠒ ⠉⠉ ⠚⠓⠾⠷⢿⣿⣿⣿⣿⣷⡈⣿⡿⣫⡌⢋⢨⠿⠛⠟⣟ ⠘⢇ ⡄⡾⠂⡘⣿",
    "⣿⣿⣿⣷⠉⢾⣏⠿⠁  ⣠⢖⣿⠛⢛⣽⣿⣿⣿⣿⠿⠇               ⠰⣄⡽⢻⠿⣿⡗⣀⠸⠜⠈⠠⠚⢷⡀  ⠈⠂⠐⠱⢣⢬⣿",
    "⣿⣿⣿⣿⣿⣮⠛⠄⢄⡀⠑⠋ ⢀⣰⣼⣿⣿⣿⣷⣶⣤⣤⣤⣤⣾⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⣦⣤⣤⣄⣈⠃ ⠿⠟⠟⠦⠄   ⣄⠄⠂  ⡌ ⠤⣗⣫⣿",
    "⣿⣿⣿⣿⣿⣶⣷⣦⡤⠤⣤⣐⣶⢿⣟⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⡿⢛⠿⠛⣝⢥  ⢸⡄⠙⠆⣌   ⠁ ⡸⠂ ⢀⠤⡺⢽⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣛⣛⣣⣭⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⣤⡄⣈⡁ ⠤⢄⠁⠰⣀⣾⣿⣿⣷⣶⣞⣺⠭⢿⣶⣿⣾⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣻⣿⣽⣿⣷⣠⣄⣄⣢⣵⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  }
  dashboard.section.header.type = 'text'
  dashboard.section.header.val = function()
    local alpha_wins = vim.tbl_filter(function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
    end, vim.api.nvim_list_wins())

    if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 54 then
      return small_header
    end
    return large_header
  end
  dashboard.section.header.opts = {
    position = "center",
    hl = "Error",
  }
  -- stylua: ignore
  dashboard.section.buttons.val = {
    dashboard.button('f', '󰥨  Find file', ':Telescope find_files <CR>'),
    dashboard.button('p', '  Recent Projects', ':Telescope projects <CR>'),
    dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('g', '󰱼  Find text', ':Telescope live_grep <CR>'),
    dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
    dashboard.button('q', '  Quit', ':qa<CR>'),
  }
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = 'AlphaButtons'
    button.opts.hl_shortcut = 'function'
  end
  dashboard.section.footer.opts = {
    hl = "String",
    position = "center",
  }
  dashboard.section.type = "group"
  dashboard.opts.layout[1].val = 7
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
      dashboard.section.footer.val = tbl
      pcall(vim.cmd.AlphaRedraw)
    end,
  })


  alpha.setup(dashboard.config)
end

return M
