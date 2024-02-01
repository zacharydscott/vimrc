opts = {noremap = true, silent = true}
buf_opts = {noremap = true, silent = true, buffer = true}
loudopts = {noremap = true, silent = false}
exopts = {noremap = true, expr = true, silent = true}
nsk = vim.keymap.set
set = vim.api.nvim_set_option
keyset = vim.keymap.set;

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

require('prettier-config')
require('settings')
require('treesitter')
require('telescopic')
require('mappings')
require('treeline')
require('git')
require('nvim-tree-config')
require('nvim-autopairs').setup{map_cr= false}
require('lsp')
require('color')
require('hatchet-config')
-- vim.api.nvim_command('echo "Hello, from the config file!"')
require('term-float-config')
require('gruvbox-config')
require('lua-map')
require('hop-config')
require('dap-config')
