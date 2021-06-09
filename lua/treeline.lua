local utils = require('nvim-treesitter.ts_utils')

vim.api.nvim_exec([[
hi link treeline_class luaTSClass
hi link treeline_function luaTSConstBuiltin
hi link treeline_function luaTSConstBuiltin
]],true)

local node_map = {
  function_declaration= { ident= 'identifier', hi= 'treeline_function'},
  method_definition= { ident= 'property_identifier', hi= 'treeline_method'},
  class_declaration= { ident= 'type_identifier', hi= 'treeline_class'},
}

local function get_treeline() 
  local node = utils.get_node_at_cursor(0)
  local treeline = ''
  while (node) do
    local node_match = node_map[node:type()]
    if (node_match) then
      local ident_node = nil
      for child in node:iter_children() do
        if (child:type() == node_match.ident) then
          ident_node = child
          break
        end
      end
      local ident_name = '>%#'..node_match.hi..'#'
      for _,line in ipairs(utils.get_node_text(ident_node)) do
        ident_name = ident_name..line
      end
      treeline = utils..treeline
    end
  end
  return string.sub(treeline,2,-1)
end

return {
  get_treeline = get_treeline
}
