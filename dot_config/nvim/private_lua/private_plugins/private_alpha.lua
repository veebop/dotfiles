
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
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
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('f', '󰥨  Find file', ':Telescope find_files <CR>'),
      dashboard.button('g', '󰱼  Find text', ':Telescope live_grep <CR>'),
      dashboard.button('s', '  Restore Session', [[:lua require('persistence').load() <cr>]]),
      dashboard.button('p', '  Recent Projects', ':Telescope projects <CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    dashboard.section.header.opts.hl = 'AlphaHeader'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    dashboard.section.footer.opts.hl = 'AlphaFooter'
    dashboard.opts.layout[1].val = 7
    return dashboard
  end,
  config = function(_, dashboard)
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

    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        -- stylua: ignore
        dashboard.section.footer.val = '⚡ ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
