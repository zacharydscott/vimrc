-- Not a complete list of mappings
-- Just a list of remaps from vanilla
-- unused ctrl keys: p g j l h (z)? k m
-- unused leader keys: 
local api = vim.api
---- Normal/Visual Mappings
--- Colemak Buffer Navigation
api.nvim_set_keymap('n','n','j',opts)
api.nvim_set_keymap('n','N','J',opts)
api.nvim_set_keymap('n','e','k',opts)
api.nvim_set_keymap('n','E','K',opts)
api.nvim_set_keymap('n','i','l',opts)
api.nvim_set_keymap('n','I','L',opts)

api.nvim_set_keymap('n','l' ,'i',opts)
api.nvim_set_keymap('n','L' ,'I',opts)
api.nvim_set_keymap('n','j' ,'e',opts)
api.nvim_set_keymap('n','J' ,'E',opts)
api.nvim_set_keymap('n','k' ,'n',opts)
api.nvim_set_keymap('n','K' ,'N',opts)

api.nvim_set_keymap('v','n','j',opts)
api.nvim_set_keymap('v','N','J',opts)
api.nvim_set_keymap('v','e','k',opts)
api.nvim_set_keymap('v','E','K',opts)

api.nvim_set_keymap('v','j','e',opts)
api.nvim_set_keymap('v','J','E',opts)
api.nvim_set_keymap('v','k','n',opts)
api.nvim_set_keymap('v','K','N',opts)

--- Window/Buffer/Tab
-- Splits and Saves
api.nvim_set_keymap('n','_',':split<CR>',opts)
api.nvim_set_keymap('n','-',':vsplit<CR>',opts)
api.nvim_set_keymap('n','<Leader>v',':tabnew<cr>',opts)
api.nvim_set_keymap('n','<Leader>w',':w<CR>',opts)
api.nvim_set_keymap('n','<Leader>W',':w!<CR>',opts)
api.nvim_set_keymap('n','<Leader>q',':q<CR>',opts)
api.nvim_set_keymap('n','<Leader>Q',':q!<CR>',opts)
api.nvim_set_keymap('n','<Leader>_',':resize +15<CR>',opts)
api.nvim_set_keymap('n','<Leader>+',':resize -15<CR>',opts)
api.nvim_set_keymap('n','<Leader>=',':vertical resize +15<CR>',opts)
api.nvim_set_keymap('n','<Leader>-',':vertical resize -15<CR>',opts)

api.nvim_set_keymap('n','<A-n>','<C-w>j',opts)
api.nvim_set_keymap('n','<A-h>','<C-w>h',opts)
api.nvim_set_keymap('n','<A-e>','<C-w>k',opts)
api.nvim_set_keymap('n','<A-i>','<C-w>l',opts)
api.nvim_set_keymap('n','<Tab>','<colon>',opts)
api.nvim_set_keymap('n','<Space>h','<C-w>h',opts)
api.nvim_set_keymap('n','<Space>n','<C-w>j',opts)
api.nvim_set_keymap('n','<Space>e','<C-w>k',opts)
api.nvim_set_keymap('n','<Space>i','<C-w>l',opts)
api.nvim_set_keymap('n','<C-w>h','<C-w>h',opts)
api.nvim_set_keymap('n','<C-w>n','<C-w>j',opts)
api.nvim_set_keymap('n','<C-w>e','<C-w>k',opts)
api.nvim_set_keymap('n','<C-w>i','<C-w>l',opts)
api.nvim_set_keymap('n','<C-w>H','<C-w>H',opts)
api.nvim_set_keymap('n','<C-w>N','<C-w>J',opts)
api.nvim_set_keymap('n','<C-w>E','<C-w>K',opts)
api.nvim_set_keymap('n','<C-w>I','<C-w>L',opts)

--- Quixkfix
api.nvim_set_keymap('n','<C-q>o',':bot copen<CR>',opts)
api.nvim_set_keymap('n','<C-q>i',':bot cclose<CR>',opts)
api.nvim_set_keymap('n','<C-t>',':cnext<CR>',opts)
api.nvim_set_keymap('n','<C-s>',':cprevious<CR>',opts)

--- Search
api.nvim_set_keymap('n','<Leader>s',':%s//g<left><Left>',loudopts)
api.nvim_set_keymap('v','<Leader>s',':s//g<left><Left><c-r>"',loudopts)
api.nvim_set_keymap('n','<Leader>r',':Rg -i ""<Left>',loudopts)
api.nvim_set_keymap('n','<Leader>R',':Rg<Space>',loudopts)


--- Misc.
api.nvim_set_keymap('n','<C-n>','<C-i>',opts)
api.nvim_set_keymap('n','<Tab>','<colon>',opts)
-- api.nvim_set_keymap('n','<Leader>km','ciw',opts)

---- Insert Mappings

---- Command Mappings
api.nvim_set_keymap('c','<C-n>','<Down>',opts)
api.nvim_set_keymap('c','<C-e>','<Up>',opts)
api.nvim_set_keymap('c','<C-s>','<C-r>"',opts)

---- Custom Commands
api.nvim_exec('command! -nargs=1 SearchMap lua require("map-search").better_map_buffer("<args>","")',true)
api.nvim_exec('command! Reload execute ":so $XDG_CONFIG_HOME/nvim/init.vim"',true)
api.nvim_exec('command! Config execute ":e $XDG_CONFIG_HOME/nvim/init.vim"',true)
