-- Header
-- DYNAMIC EXAMPLE
-- require("alpha.term")
-- local dynamic_header = {
--   type = "terminal",
--   command = "chafa -c full --fg-only --symbols braille ~/.config/nvim/static/db.gif",
--   width = 90,
--   height = 20,
--   opts = {
--     position = "center",
--     redraw = true,
--     window_config = {},
--   },
-- }
--[[ local default_header = nil
local ret = "command -v chafa"

if ret == 0 
  default_header = dynamic_header
else
  default_header = text_header ]]


local small_header_old = {
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⢹⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⡿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡛⡛⠊⠈⠘⠯⠦⠿⠿⢿⣎⢷⠸⡿⠟⡱⡿⢿⢛⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣡⣦⡄⣶⣶⣦⣴⣶⠔⠈ ⠛⠈⢑⣮⡵⠿⠟⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣸⣿⣽⣿⣿⣿⣧ ⡔⠂⠁  ⢬⠶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠋⠁ ⠠ ⡈⡄⢠⠁⠙⡚⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⡿⡿⠋⢁⣈⣉    ⡀⣀⣠⣄⢿⡦⢲⣦⡈⡩⢽⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡫⠁ ⢈⣹⣿⣛⣀⣠⣄⣀⣀⣀⣉⡙⠺⢝⠉⢐⠁  ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣅⣁⣘⣀⣶⣤⣾⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
}

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

lvim.builtin.alpha.dashboard.section.header = {
    type = "text",
    val = function()
      local alpha_wins = vim.tbl_filter(function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
      end, vim.api.nvim_list_wins())

      if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 54 then
        return small_header
      end
      return large_header
    end,
    opts = {
      position = "center",
      hl = "DiagnosticError",
    },
  }

