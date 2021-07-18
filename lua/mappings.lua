-- Not a complete lis of mappings
-- Just a list of remaps from vanilla
-- unused ctrl keys: p g j l h (z)? k m
-- unused leader keys: 
local api = vim.api
-- local nsk = vim.api.nvim_set_keymap
---- Normal/Visual Mappings
--- Colemak Buffer Navigation
vim.opt.langmap='nj,ek,il,je,kn,li,NJ,EK,IL,JE,KN,LI'
vim.opt.langremap = false

--- Window/Buffer/Tab
-- Splits and Saves
nsk('n','<C-s>','<C-^>',opts)
nsk('n','<C-h>',':prev<cr>',opts)
nsk('n','<C-l>',':next<cr>',opts)
nsk('n','-',':split<CR>',opts)
nsk('n','+',':vsplit<CR>',opts)
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

nsk('n','<A-h>','<C-w>j',opts)
nsk('n','<A-j>','<C-w>h',opts)
nsk('n','<A-k>','<C-w>k',opts)
nsk('n','<A-l>','<C-w>l',opts)
nsk('n','<Leader>h','<C-w>h',opts)
nsk('n','<Leader>j','<C-w>j',opts)
nsk('n','<Leader>k','<C-w>k',opts)
nsk('n','<Leader>l','<C-w>l',opts)

--- Quixkfix
nsk('n','<C-q>o',':bot copen<CR>',opts)
nsk('n','<C-q>i',':bot cclose<CR>',opts)
nsk('n','<C-n>',':cnext<CR>',opts)
nsk('n','<C-p>',':cprevious<CR>',opts)

-- Arglist
nsk('n','<A-j>',':next<CR>',opts)
nsk('n','<A-k>',':previous<CR>',opts)
nsk('n','<A-a>',':argadd %<CR>',opts)
nsk('n','<A-d>',':argdelete %<CR>',opts)
nsk('n','<A-p>',':args<CR>',opts)

--- Search
nsk('n','<Leader>s',':%s//g<left><Left>',loudopts)
nsk('v','<Leader>s',':s//g<left><Left>',loudopts)
nsk('n','<Leader>r',':Rg -i ""<Left>',loudopts)
nsk('n','<Leader>R',':Rg<Space>',loudopts)

--- Misc.
nsk('n','<Backspace>',':',loudopts)
nsk('n','<Leader>a','ggVG',opts)
nsk('n','<Leader>.','@:',opts)
nsk('n','Y','^bwv$wby',opts)
nsk('n','zs','zt7<c-y>',opts)
nsk('n','/',':set hlsearch<cr>/',loudopts)
nsk('n','*',':set hlsearch<cr>*',loudopts)
nsk('n','#',':set hlsearch<cr>#',loudopts)
nsk('n','<a-i>',':set hlsearch!<cr>',opts)
nsk('n','<a-u>',':set ic!<cr>',opts)
nsk('n','<a-s>',':set spell!<cr>',opts)
-- I'm in love with this
nsk('n','<Leader>dj',':let json_count += 1<cr> :execute "vs JSON_".json_count<CR>ggVG"_dp:%!python -m json.tool<CR>',opts)
nsk('v','<Leader>dj','y:let json_count += 1<cr> :execute "vs JSON_".json_count<CR>ggVG"_dp:%!python -m json.tool<CR>',opts)
-- nsk('t','<C-e>','<C-\><C-n>',opts)

-- ---- Insert Mappings
-- nsk('i','<c-s>','<c-r>"',opts)
-- nsk('i','{<CR>','{<CR>}<ESC>O',{silent= true,noremap = true, nowait = true})
-- nsk('i','(<CR>','(<CR>)<ESC>O',opts)
-- nsk('i','[<CR>','[<CR>]<ESC>O',opts)

---- Command Mappings
nsk('c','<C-n>','<Down>',loudopts)
nsk('c','<C-e>','<Up>',loudopts)
-- nsk('c','<C-e>','<Up>',loudopts)
-- nsk('c','<C-h>','<Left>',loudopts)
-- nsk('c','<C-i>','<Right>',loudopts)
nsk('c','<C-s>','<C-r>"',loudopts)
nsk('i','<C-s>','<C-r>"',loudopts)
-- account for langmap
nsk('v','l','i',loudopts)
nsk('o','l','i',loudopts)
nsk('v','i','l',loudopts)
nsk('o','i','l',loudopts)
nsk('v','lr','i{',opts)
nsk('o','lr','i{',opts)
nsk('v','ar','a{',opts)
nsk('o','ar','a{',opts)
nsk('v','la','i(',opts)
nsk('o','la','i(',opts)
nsk('v','aa','a(',opts)
nsk('o','aa','a(',opts)

nsk('v','aj','aW',opts)
nsk('o','aj','aW',opts)
nsk('v','lj','iW',opts)
nsk('o','lj','iW',opts)


---- Custom Commands
-- api.nvim_exec('command! -nags=1 SearchMap lua require("map-search").better_map_buffer("<args>","")',true)
api.nvim_exec('command! Reload execute ":so $XDG_CONFIG_HOME/nvim/init.vim"',true)
api.nvim_exec('command! Config execute ":e $XDG_CONFIG_HOME/nvim/init.vim"',true)
api.nvim_exec('command! MoveConfig execute ":cd $XDG_CONFIG_HOME/nvim"',true)

nsk('n','<Leader>nc',':Config<CR>',opts)
nsk('n','<Leader>ns',':SnipMateOpenSnippetFiles<CR>',opts)
nsk('n','<Leader>nr',':Reload<CR>',opts)
nsk('n','<Leader>nm',':SearchMap<Space>',opts)
nsk('n','<Leader>nd',':MoveConfig<Space><CR>',opts)
