require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>,s",
      node_incremental = "<Leader>,n",
      scope_incremental = "<Leader>,c",
      node_decremental = "<Leader>,m",
    },
  },
}
