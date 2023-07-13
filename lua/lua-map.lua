local bound_funcs = {
	n = {},
	v = {},
	i = {},
	x = {}
}

-- Lua Set Keymap - Pass a lua function instaed of a string
-- to map a key in normal, visual, insert, command, operator modes
local lsk = function(mode, keys, func, options)
  local leader_key = vim.g.mapleader
  keys = keys:gsub('<Leader>',' ')
  keys = keys:gsub('<leader>',' ')
  bound_funcs[mode][keys] = func
  vim.api.nvim_set_keymap(mode, keys,':lua require("lua-map").bound_funcs["'..mode..'"]["'..keys..'"]()<CR>' , options)
end

local execute_lsk = function(mode, keys)
  bound_funcs[mode][keys]()
end

return {
	lsk = lsk,
	execute_lsk = execute_lsk,
	bound_funcs = bound_funcs
}
