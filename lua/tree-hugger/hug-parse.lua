-- Allows declarative key maps
-- Pulls user input to decide what fucntion call
-- to make:
-- * language
-- * query (base text object)
-- * optionals (name, body, parameters, etc.)
-- * sub optionals (in, around)

local sub_mod_map = {
  ['a'] = 'around',
  ['i'] = 'in',
}

local base_mod_map = {
  ['p'] = 'parameters',
  ['n'] = 'name',
  ['b'] = 'body',
  ['r'] = 'return',
}

local obj_map = {
  ['f'] = 'function',
  ['c'] = 'class',
}

function hug_parse()
  local obj = nil
  local mod = nil
  local sub_mod = nil
  repeat
    local next = vim.fn.nr2char(vim.fn.getchar())
    if not sub_mod and sub_mod_map[next] then
      sub_mod = sub_mod_map[next]
    elseif not mod and base_mod_map[next] then
      mod = base_mod_map[next]
    elseif obj_map[next] then
      obj = obj_map[next]
      if not mod and sub_mod then
        mod = sub_mod
        sub_mod = nil
      end
    end
  until obj
  return obj, mod, sub_mod
end

return {
  hug_parse = hug_parse
}
