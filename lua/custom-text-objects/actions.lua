local api = vim.api
local ts = vim.treesitter
local function_query = ts.parse_query("typescript",[[
(method_definition 
(property_identifier) @name
(formal_parameters) @parameters
(statement_block) @body
) @root
]])

api.nvim_set_keymap('v', 'ifn', ':lua require("custom-text-objects.node-select").select_function("name",false)<cr>',opts)

api.nvim_set_keymap('v', 'ifp', ':lua require("custom-text-objects.node-select").select_function("parameters",true)<cr>',opts)
api.nvim_set_keymap('v', 'afp', ':lua require("custom-text-objects.node-select").select_function("parameters",false)<cr>',opts)
