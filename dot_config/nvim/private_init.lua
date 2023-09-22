vim.g.mapleader = ' '
vim.g.maplocalleader = ','
-- bootstrap lazy.nvim
require("core.lazy")
-- set my preferences
require("core.options")
-- setup autocommands
require("core.autocmds")
-- setup custom keybindings
require("core.keybindings")
