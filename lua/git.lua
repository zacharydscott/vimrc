-- local nsk = vim.api.nvim_set_keymap
local floatGitStr = ':FloatTermSwitchOrAdd Git<cr>git '
nsk('n','<Leader>gt',':G<Space>',opts)
nsk('n','<Leader>gg',':G<CR>',opts)
nsk('n','<Leader>gs',':call GitAddAndCheck()<CR>',opts)
nsk('n','<Leader>gp',':Git pull<CR>',opts)
nsk('n','<Leader>gP', floatGitStr..'pull --all<CR>',opts)
nsk('n','<Leader>gu',':Git push<CR>',opts)
nsk('n','<Leader>ga', floatGitStr..'status<CR>',opts)
nsk('n','<Leader>gf',':Git fetch<CR>',opts)
nsk('n','<Leader>gF',':Git fetch --all<CR>',opts)
nsk('n','<Leader>gb',':G blame<CR>',opts)
nsk('n','<Leader>gm',':Magit<CR>',opts)
nsk('n','<Leader>gc', floatGitStr..'commit -m "<left>"',loudopts)
nsk('n','<Leader>go',':G checkout<Space>',loudopts)
nsk('n','<Leader>ge',':G merge<Space>',opts)
nsk('n','<Leader>gq',':Rg "<<<<<<< HEAD"<CR>',opts)
nsk('n','<Leader>gi',"0b/<<<<<CR>V/====<CR>d/>>>>><CR>dd",opts)
nsk('n','<Leader>gh',"0bb/<<<<<CR>dd/=====<CR>V/>>>>><CR>d",opts)
-- nsk('n','<Leader>gh',':diffget //2<CR>',opts)
-- nsk('n','<Leader>gi',':diffget //3<CR>',opts)

-- Blamer
nsk('n','<A-b>',':BlamerToggle<CR>',opts)
