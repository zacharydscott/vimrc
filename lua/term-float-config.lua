require'float-term':setup{ }
 
 nsk('n','<Leader><Leader>',':FloatTermToggle<CR>',loudopts)
 nsk('t','<C-t>',[[<C-\><C-n>]],loudopts)
 nsk('t','<Leader><Leader>',[[<C-\><C-n>:FloatTermToggle<CR>]],loudopts)
 nsk('t','<C-n>',[[<C-\><C-n>:FloatTermCycle 1<CR>]],loudopts)
 nsk('t','<C-p>',[[<C-\><C-n>:FloatTermCycle -1<CR>]],loudopts)
 nsk('t','<c-a>',[[<C-\><C-n>:FloatTermAdd<CR> ]],loudopts)
 nsk('t','<c-w>',[[<C-\><C-n>:FloatTermAdd ]],loudopts)
 nsk('t','<c-q>',[[<C-\><C-n>:FloatTermRemove<CR>]],loudopts)
 nsk('t','<c-r>',[[<C-\><C-n>:FloatTermRename ]],loudopts)

-- nsk('n','<Leader><Leader>',[[:lua tf:float_toggle()<CR>]],opts)
-- nsk('t','<C-t>',[[<C-\><C-n>]],opts)
-- nsk('t','<Leader><Leader>',[[<C-\><C-n>:lua tf:float_close()<CR>]],opts)
-- nsk('t','<C-p>',[[<C-\><C-n>:lua tf:cycle_term(1)<CR>]],opts)
-- nsk('t','<C-f>',[[<C-\><C-n>:lua tf:cycle_term(-1)<CR>]],opts)
-- nsk('t','<c-a>',[[<C-\><C-n>:lua tf:add_terminal()<CR>]],loudopts)
