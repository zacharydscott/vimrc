vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
nsk('n','<Leader>o',':NvimTreeToggle<CR>',opts)
nsk('n','<Leader>O',':NvimTreeFindFile<CR>',opts)

-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- vim.g.nvim_tree_bindings = {
	  -- ["N"]              = tree_cb("last_sibling"),
	  -- ["J"]              = tree_cb("first_sibling"),
-- }
