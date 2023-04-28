opts = {noremap = true, silent = true}
loudopts = {noremap = true, silent = false}
exopts = {noremap = true, expr = true, silent = true}
nsk = vim.api.nvim_set_keymap
set = vim.api.nvim_set_option

function printDeepTable(table, space)
	if not space then space = '' end
	for n,v in pairs(table) do
		if type(v) == 'table' then
			print(space..n..': {')
			printDeepTable(v,space..'  ')
			print('}')
		else
			print(space..n..': ',v)
		end
	end
end

require('treesitter')
require('telescopic')
require('mappings')
require('treeline')
require('git')
require('nvim-tree-config')
require('settings')
require('nvim-autopairs').setup{map_cr= false}
require('lsp')
require('color')
require('hatchet-config')
-- require('term-float-config')
