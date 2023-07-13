require('hatchet').setup({

})

nsk('o','<leader>',':<c-u>lua require("hatchet").select()<CR>',opts)
nsk('v','<leader>',':<c-u>lua require("hatchet").select()<CR>',opts)
nsk('n',',',':<c-u>lua require("hatchet").move()<CR>',opts)
nsk('n',',,',':<c-u>lua require("hatchet").repeat_move()<CR>',opts)
nsk('n',',;',':<c-u>lua require("hatchet").repeat_move(true)<CR>',opts)

local function cursor_path()
	local curr_node =  require'nvim-treesitter.ts_utils'.get_node_at_cursor()
	node_path = {}
	path_str = ''
	while curr_node do
		table.insert(node_path,curr_node)
		path_str = curr_node:type()..'> '..path_str
		curr_node = curr_node:parent()
	end
	return path, path_str
end

-- nsk('n','<leader>bk',':lua require"hatchet-config".cursor_path() print(path_str)<cr>',opts)

return { cursor_path = cursor_path }
