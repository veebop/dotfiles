-- Set leader and localleader before any plugins are initialized
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('plugins')
require('options')
require('autocmds')
require('keybindings')
