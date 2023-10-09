nsk('n','<Leader><Tab>',':NvimTreeToggle<CR>',opts)
nsk('n','<Leader><S-Tab>',':NvimTreeFindFile<CR>',opts)
require'nvim-tree'.setup {
 sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  view = {
	  mappings	= {
		  list = {
		  }
	  }
  },
  filters = {
    dotfiles = true,
  },}
-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- vim.g.nvim_tree_bindings = {
	  -- ["N"]              = tree_cb("last_sibling"),
	  -- ["J"]              = tree_cb("first_sibling"),
-- }
