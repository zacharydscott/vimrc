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
 nsk('t','<C-e>',[[<C-\><C-n>]],loudopts)
 nsk('t','<C-n>',[[<C-\><C-n>:FloatTermCycle 1<CR>]],loudopts)
 nsk('t','<C-p>',[[<C-\><C-n>:FloatTermCycle -1<CR>]],loudopts)
 nsk('t','<c-a>',[[<C-\><C-n>:FloatTermAdd<CR> ]],loudopts)
 nsk('t','<c-w>',[[<C-\><C-n>:FloatTermAdd ]],loudopts)
 nsk('t','<c-q>',[[<C-\><C-n>:FloatTermRemove<CR>]],loudopts)
 nsk('t','<c-r>',[[<C-\><C-n>:FloatTermRename ]],loudopts)

-- nsk('n','<Leader><Leader>',[[:lua tf:float_toggle()<CR>]],opts)*
-- nsk('t','<C-t>',[[<C-\><C-n>]],opts)
-- nsk('t','<Leader><Leader>',[[<C-\><C-n>:lua tf:float_close()<CR>]],opts)*
-- nsk('t','<C-p>',[[<C-\><C-n>:lua tf:cycle_term(1)<CR>]],opts)
-- nsk('t','<C-f>',[[<C-\><C-n>:lua tf:cycle_term(-1)<CR>]],opts)
-- nsk('t','<c-a>',[[<C-\><C-n>:lua tf:add_terminal()<CR>]],loudopts)
