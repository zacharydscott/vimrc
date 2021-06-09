utils = require('nvim-treesitter.ts_utils')
th_selection = require('selection')
local query = [[
    [(local_function) @root (function) @root]
    ]]

local function hug_motion()
  local obj_name, mod, sub_mod = require('tree-hugger.hug-parse').hug_parse()
 local obj = require('tree-hugger.definitions.lua')[obj_name]
 if obj.function then
   obj.function(mod, sub_mod)
   else
     
   end
 vim.treesitter.parse_query("lua",query)
 print
end

hug_motion()
