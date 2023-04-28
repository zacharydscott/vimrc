local function term_attach()
  vim.api.nvim_exec([[
    nnoremap <buffer> <c-p> <C-\><C-n>:FloatTermCycle -1<CR>
    nnoremap <buffer> <c-n> <C-\><C-n>:FloatTermCycle 1<CR>
    nnoremap <buffer> <c-r> <C-\><C-n>:FloatTermRename 
    nnoremap <buffer> <c-w> <C-\><C-n>:FloatTermAdd 
    nnoremap <buffer> <c-a> <C-\><C-n>:FloatTermAdd<CR>
    nnoremap <buffer> <c-q> <C-\><C-n>:FloatTermemove<CR>
    nnoremap <buffer> u <c-u>
    nnoremap <buffer> d <c-d>
  ]],true)
end

require'float-term':setup{ 
  term_attach = term_attach
}
 
nsk('n','<C-t>',':FloatTermToggle<CR>',loudopts)
nsk('t','<C-t>',[[<C-\><C-n>:FloatTermToggle<CR>]],loudopts)
nsk('t','<A-e>',[[<C-\><C-n>]],loudopts)
nsk('t','<A-n>',[[<C-\><C-n>:FloatTermCycle 1<CR>]],loudopts)
nsk('t','<A-p>',[[<C-\><C-n>:FloatTermCycle -1<CR>]],loudopts)
nsk('t','<A-a>',[[<C-\><C-n>:FloatTermAdd<CR> ]],loudopts)
nsk('t','<A-w>',[[<C-\><C-n>:FloatTermAdd ]],loudopts)
nsk('t','<A-q>',[[<C-\><C-n>:FloatTermRemove<CR>]],loudopts)
nsk('t','<A-r>',[[<C-\><C-n>:FloatTermRename ]],loudopts)
