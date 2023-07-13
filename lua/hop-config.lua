require'hop'.setup {
	keys = 'ntesiroahdufywmvzcxqkbjg'
}
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n','<CR>',hop.hint_char2)
-- vim.keymap.set('n','',hop.hint_words)
