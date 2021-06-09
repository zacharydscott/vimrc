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
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aF"] = {
          typescript = "(function_declaration) @function",
          ts = "(method_declaration) @function",
          javascript = "(method_declaration) @function",
          js = "(method_declaration) @function",
        },
        ["iF"] = {
          typescript ="@function.inner",
          ts ="@function.inner",
          javascript ="@function.inner",
          js ="@function.inner",
        },
        -- Or you can define your own textobjects like this
      },
    },
  },
}
