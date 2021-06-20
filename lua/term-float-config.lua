local tf = require'float-term'
 
function new_term()
  tf.float_open()
  vim.api.nvim_exec([[normal!<c-\><c-n> :require('float-term'):add_terminal("")<left><left>]],true)
end

 nsk('n','<Leader><Leader>',[[:lua require("float-term"):float_toggle()<CR>]],opts)
 nsk('t','<C-t>',[[<C-\><C-n>]],opts)
 nsk('t','<Leader><Leader>',[[<C-\><C-n>:lua require("float-term"):float_close()<CR>]],opts)
 nsk('t','<C-n>',[[<C-\><C-n>:lua require("float-term"):cycle_term(1)<CR>]],opts)
 nsk('t','<C-p>',[[<C-\><C-n>:lua require("float-term"):cycle_term(-1)<CR>]],opts)
 nsk('t','<c-a>',[[<C-\><C-n>:lua require("float-term"):add_term()<CR>]],loudopts)
 nsk('t','<c-c>',[[<C-\><C-n>:lua require("float-term"):close_current_term()<CR>]],loudopts)

-- nsk('n','<Leader><Leader>',[[:lua tf:float_toggle()<CR>]],opts)
-- nsk('t','<C-t>',[[<C-\><C-n>]],opts)
-- nsk('t','<Leader><Leader>',[[<C-\><C-n>:lua tf:float_close()<CR>]],opts)
-- nsk('t','<C-p>',[[<C-\><C-n>:lua tf:cycle_term(1)<CR>]],opts)
-- nsk('t','<C-f>',[[<C-\><C-n>:lua tf:cycle_term(-1)<CR>]],opts)
-- nsk('t','<c-a>',[[<C-\><C-n>:lua tf:add_terminal()<CR>]],loudopts)
