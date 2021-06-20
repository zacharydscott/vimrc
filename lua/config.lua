opts = {noremap = true, silent = true}
loudopts = {noremap = true, silent = false}
exopts = {noremap = true, expr = true, silent = true}
nsk = vim.api.nvim_set_keymap
set = vim.api.nvim_set_option
require('treesitter')
require('telescopic')
require('mappings')
require('treeline')
require('git')
require('nvim-tree-config')
require('settings')
require('lsp')
-- require('term-float-config')
