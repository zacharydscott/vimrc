-- Not a complete list of mappings
-- Just a list of remaps from vanilla
-- unused ctrl keys: p g j l h (z)? k m
-- unused leader keys: 
local api = vim.api
-- local nsk = vim.api.nvim_set_keymap
---- Normal/Visual Mappings
--- Colemak Buffer Navigation
nsk('n','n','j',opts)
nsk('n','N','J',opts)
nsk('n','e','k',opts)
nsk('n','E','K',opts)
nsk('n','i','l',opts)
nsk('n','I','L',opts)

nsk('n','l' ,'i',opts)
nsk('n','L' ,'I',opts)
nsk('n','j' ,'e',opts)
nsk('n','J' ,'E',opts)
nsk('n','k' ,'n',opts)
nsk('n','K' ,'N',opts)

nsk('v','n','j',opts)
nsk('v','N','J',opts)
nsk('v','e','k',opts)
nsk('v','E','K',opts)

nsk('v','j','e',opts)
nsk('v','J','E',opts)
nsk('v','k','n',opts)
nsk('v','K','N',opts)

--- Window/Buffer/Tab
-- Splits and Saves
nsk('n','_',':split<CR>',opts)
nsk('n','-',':vsplit<CR>',opts)
nsk('n','<Leader>_',':resize +15<CR>',opts)
nsk('n','<Leader>+',':resize -15<CR>',opts)
nsk('n','<Leader>=',':vertical resize +15<CR>',opts)
nsk('n','<Leader>-',':vertical resize -15<CR>',opts)
nsk('n','<Leader>v',':tabnew<cr>',opts)
nsk('n','<Leader>w',':w<CR>',opts)
nsk('n','<Leader>W',':w!<CR>',opts)
nsk('n','<Leader>q',':q<CR>',opts)
nsk('n','<Leader>Q',':q!<CR>',opts)
nsk('n','<Leader>_',':resize +15<CR>',opts)
nsk('n','<Leader>+',':resize -15<CR>',opts)
nsk('n','<Leader>=',':vertical resize +15<CR>',opts)
nsk('n','<Leader>-',':vertical resize -15<CR>',opts)

nsk('n','<A-n>','<C-w>j',opts)
nsk('n','<A-h>','<C-w>h',opts)
nsk('n','<A-e>','<C-w>k',opts)
nsk('n','<A-i>','<C-w>l',opts)
nsk('n','<Space>h','<C-w>h',opts)
nsk('n','<Space>n','<C-w>j',opts)
nsk('n','<Space>e','<C-w>k',opts)
nsk('n','<Space>i','<C-w>l',opts)
nsk('n','<C-w>h','<C-w>h',opts)
nsk('n','<C-w>n','<C-w>j',opts)
nsk('n','<C-w>e','<C-w>k',opts)
nsk('n','<C-w>i','<C-w>l',opts)
nsk('n','<C-w>H','<C-w>H',opts)
nsk('n','<C-w>N','<C-w>J',opts)
nsk('n','<C-w>E','<C-w>K',opts)
nsk('n','<C-w>I','<C-w>L',opts)

--- Quixkfix
nsk('n','<C-q>o',':bot copen<CR>',opts)
nsk('n','<C-q>i',':bot cclose<CR>',opts)
nsk('n','<C-t>',':cnext<CR>',opts)
nsk('n','<C-s>',':cprevious<CR>',opts)

--- Search
nsk('n','<Leader>s',':%s//g<left><Left>',loudopts)
nsk('v','<Leader>s',':s//g<left><Left><c-r>"',loudopts)
nsk('n','<Leader>r',':Rg -i ""<Left>',loudopts)
nsk('n','<Leader>R',':Rg<Space>',loudopts)


--- Misc.
nsk('n','<Backspace>',':',loudopts)
nsk('n','<Leader>a','ggVG',opts)
nsk('n','<Leader>.','@:',opts)
nsk('n','<Leader>d',':Explore<CR>',opts)

---- Insert Mappings
nsk('i','<c-s>','<c-r>"',opts)

---- Command Mappings
nsk('c','<C-n>','<Down>',loudopts)
nsk('c','<C-e>','<Up>',loudopts)
nsk('c','<C-h>','<Left>',loudopts)
nsk('c','<C-o>','<Right>',loudopts)
nsk('c','<C-s>','<C-r>"',loudopts)

---- Custom Commands
api.nvim_exec('command! -nargs=1 SearchMap lua require("map-search").better_map_buffer("<args>","")',true)
api.nvim_exec('command! Reload execute ":so $XDG_CONFIG_HOME/nvim/init.vim"',true)
api.nvim_exec('command! Config execute ":e $XDG_CONFIG_HOME/nvim/init.vim"',true)

nsk('n','<Leader>kc',':Config<CR>',opts)
nsk('n','<Leader>ks',':SnipMateOpenSnippetFiles<CR>',opts)
nsk('n','<Leader>kr',':Reload<CR>',opts)
nsk('n','<Leader>km',':SearchMap<Space>',opts)
nsk('n','<Leader>kp',':CtrlPClearCache<CR>',opts)
