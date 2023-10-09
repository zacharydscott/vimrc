-- Not a complete lis of mappings
-- Just a list of remaps from vanilla
-- unused ctrl keys: p g j l h (z)? k m
-- unused leader keys:
local api = vim.api
local lsk = require('lua-map').lsk
-- local nsk = vim.api.nvim_set_keymap
---- Normal/Visual Mappings
--- Colemak Buffer Navigation
-- vim.opt.langmap='nj,ek,il,je,kn,li,NJ,EK,IL,JE,KN,LI'
vim.opt.langremap = false

-- functions
local quickfix_toggle = function()
	local qf_open = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_open = true
		end
	end
	if qf_open == true then
		vim.cmd "cclose"
		return
	end
	-- local last_win = vim.api.nvim_get_current_win()
	vim.cmd("copen")
	-- vim.api.nvim_set_current_win(last_win)
end

--- Window/Buffer/Tab
-- Splits and Saves
nsk('n','<C-s>','<C-^>',opts)
nsk('n','<C-h>',':prev<cr>',opts)
nsk('n','<C-l>',':next<cr>',opts)
nsk('n','+',':split<CR>',opts)
nsk('n','-',':vsplit<CR>',opts)
nsk('n','<Leader>v',':tabnew<cr>',opts)
nsk('n','<Leader>w',':w<CR>',opts)
nsk('n','<Leader>W',':w!<CR>',opts)
nsk('n','<Leader>q',':q<CR>',opts)
nsk('n','<Leader>Q',':q!<CR>',opts)
nsk('n','<Leader>-',':resize +15<CR>',opts)
nsk('n','<Leader>+',':resize -15<CR>',opts)
nsk('n','<Leader>=',':vertical resize +15<CR>',opts)
nsk('n','<Leader>_',':vertical resize -15<CR>',opts)
nsk('n','<A-h>','<C-w>j',opts)
nsk('n','<A-n>','<C-w>h',opts)
nsk('n','<A-e>','<C-w>k',opts)
nsk('n','<A-i>','<C-w>l',opts)
nsk('n','<Leader>h','<C-w>h',opts)
nsk('n','<Leader>n','<C-w>j',opts)
nsk('n','<Leader>e','<C-w>k',opts)
nsk('n','<Leader>i','<C-w>l',opts)

--- Quixkfix
-- lsk('n','<Leader>f',quickfix_toggle,opts)
nsk('n','<C-n>',':cnext<CR>zt3<C-y>',opts)
nsk('n','<C-p>',':cprevious<CR>zt3<C-y>',opts)

-- Arglist
nsk('n','<A-n>',':next<CR>',opts)
nsk('n','<A-e>',':previous<CR>',opts)
nsk('n','<A-a>',':argadd %<CR>',opts)
nsk('n','<A-d>',':argdelete %<CR>',opts)
nsk('n','<A-p>',':args<CR>',opts)

--- Search
nsk('n','<Leader>s',':%s//g<left><Left>',loudopts)
nsk('v','<Leader>s',':s//g<left><Left>',loudopts)
nsk('n','<Leader>r',':Rg -i ""<Left>',loudopts)
nsk('n','<Leader>R',':Rg -i -F ""<Left>',loudopts)
nsk('n','<Leader>c','yiw:Rg -i ""<Left><c-r>"<CR>',loudopts)
nsk('n','<Leader>C','yiW:Rg -i ""<Left><c-r>"<CR>',loudopts)

--- Vimwiki
nsk('n', '<Leader>uu', ':VimwikiIndex<CR>',opts)
nsk('n', '<Leader>ut', ':VimwikiTabIndex<CR>',opts)
nsk('n', '<Leader>us', ':VimwikiUISelect<CR>',opts)
nsk('n', '<Leader>ui', ':VimwikiDiaryIndex<CR>',opts)
nsk('n', '<Leader>uc', ':VimwikiColorize<CR>',opts)
nsk('n', '<Leader>un', ':VimwikiGoto<CR>',opts)
nsk('n', '<Leader>ud', ':VimwikiDeleteFile<CR>',opts)
nsk('n', '<Leader>ur', ':VimwikiRenameFile<CR>',opts)
nsk('n', '<Leader>ui', ':VimwikiIndex<CR>',opts)

--- Misc.
nsk('n','<Backspace>',':',loudopts)
nsk('n','<Leader>a','ggVG',opts)
nsk('n','<Leader>.','@:',opts)
nsk('n','Y','^bwv$wby',opts)
nsk('n','zs','zt7<c-y>',opts)
nsk('n','/',':set hlsearch<cr>/',loudopts)
nsk('n','*',':set hlsearch<cr>*',loudopts)
nsk('n','#',':set hlsearch<cr>#',loudopts)
nsk('n','<A-l>',':set hlsearch!<cr>',opts)
nsk('n','<A-u>',':set ic!<cr>',opts)
nsk('n','<A-s>',':set spell!<cr>',opts)
nsk('n','<A-c>',':if g:copilot_enabled | let g:copilot_enabled = 0 | else | let g:copilot_enabled = 1 | endif | Copilot status<CR>',opts)
-- I'm in love with this
nsk('n','<Leader>dn',':let json_count += 1<cr> :execute "vs JSON_".json_count<CR>ggVG"_dp:%!python -m json.tool<CR>',opts)
nsk('v','<Leader>dn','y:let json_count += 1<cr> :execute "vs JSON_".json_count<CR>ggVG"_dp:%!python -m json.tool<CR>',opts)

---- Command Mappings
nsk('i','<C-s>','<C-r>"',loudopts)
api.nvim_exec('command! Reload execute ":so $XDG_CONFIG_HOME/nvim/init.vim"',true)
api.nvim_exec('command! Config execute ":e $XDG_CONFIG_HOME/nvim/init.vim"',true)
api.nvim_exec('command! MoveConfig execute ":cd $XDG_CONFIG_HOME/nvim"',true)

nsk('n','<Leader>kc',':Config<CR>',opts)
nsk('n','<Leader>ks',':SnipMateOpenSnippetFiles<CR>',opts)
nsk('n','<Leader>kr',':Reload<CR>',opts)
nsk('n','<Leader>km',':SearchMap<Space>',opts)
nsk('n','<Leader>kd',':MoveConfig<Space><CR>',opts)
nsk('n','<Leader>kx',':vert new | r ! ',opts)
nsk('n','<Leader>kj',':%s/ng-class/ngClass<cr>:%s/ng-if/*ngIf<cr>:%s/ng-for/*ngFor<cr>',opts)
keyset('n','<Leader>kh',   function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end,opts)
-- nsk('n','<Leader>b',':nmap <space>',opts)
