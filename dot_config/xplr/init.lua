version = "0.21.5"

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
    .. ";"
    .. xpm_path
    .. "/?.lua;"
    .. xpm_path
    .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
  plugins = {
    { 'dtomvan/xpm.xplr' }, -- Let xpm manage itself
    { 'dy-sh/dysh-style.xplr' },
    { 'sayanarijit/dua-cli.xplr' },
    { 'sayanarijit/fzf.xplr' },
    { 'sayanarijit/tree-view.xplr' },
    { 'sayanarijit/zoxide.xplr' },
    { 'gitlab:hartan/web-devicons.xplr' },
  },
  auto_install = true,
  auto_cleanup = true,
})

require("dua-cli").setup({
  mode = "action",
  key = "D",
})

require("fzf").setup({
  mode = "default",
  key = "ctrl-f",
  bin = "fzf",
  args = "--preview 'bat {}'",
  recursive = false, -- If true, search all files under $PWD
  enter_dir = false, -- Enter if the result is directory
})


require("tree-view").setup({
  mode = "switch_layout",
  key = "T",
  toggle_layout_mode = "default",
  toggle_layout_key = "esc",
  close_all_and_back_mode = "default",
  close_all_and_back_key = "backspace",
  toggle_expansion_mode = "default",
  toggle_expansion_key = "o",
  toggle_expansion_all_mode = "default",
  toggle_expansion_all_key = "O",
  focus_next_mode = "default",
  focus_next_key = "]",
  focus_prev_mode = "default",
  focus_prev_key = "[",
  goto_next_open_mode = "default",
  goto_next_open_key = ")",
  goto_prev_open_mode = "default",
  goto_prev_open_key = "(",
  fullscreen = false,
  indent = "  ",
  as_initial_layout = true,
  as_default_layout = false,
  fallback_layout = "Table",
  fallback_threshold = 500, -- default: nil (disabled)
})

require("zoxide").setup({
  bin = "zoxide",
  mode = "default",
  key = "Z",
})
