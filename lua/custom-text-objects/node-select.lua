local utils = require 'nvim-treesitter.ts_utils'
local ts = vim.treesitter
local api = vim.api

local function is_cursor_in_node(node,win)
  local cursor_row, cursor_col = unpack(api.nvim_win_get_cursor(win))
  cursor_row = cursor_row - 1
  cursor_col = cursor_col - 1
  local start_row, start_col, end_row, end_col = node:range()
  return (cursor_row > start_row or (cursor_row >= start_row and cursor_col >= start_col))and
  (cursor_row < end_row or (cursor_row <= end_row and cursor_col <= end_col))
end


local function offset_inner_range(sr,sc,er,ec)
  if sr == er and sc == ec then
    return sr, sc, er, ec
  end
  local lines = api.nvim_buf_get_lines(0, sr, er + 1, true)
  if sc + 1 == string.len(lines[1]) + 1 then
    sr = sr + 1
    sc = 0
  else 
    sc = sc + 1
  end
  if ec == 0 then
    er = er - 1
    local len_lines = table.getn(len_lines)
    ec = string.len(lines[len_lines - 1]) + 2
  else
    ec = ec - 1
  end
  return sr, sc, er, ec
end

local function set_visual_selection(sr,sc,er,ec)
  local mode = api.nvim_get_mode() 
  if mode == 'v' then
    nvim.cmd('normal! <ESC>')
  end
  api.nvim_win_set_cursor(0,{sr+1,sc})
  vim.cmd('normal! v')
  api.nvim_win_set_cursor(0,{er+1,ec-1})
end


local function_query = ts.parse_query("typescript",[[
(method_definition 
(property_identifier) @name
(formal_parameters) @parameters
(statement_block) @body
) @root
]])

local function query_at_cursor(query, target)
  local curr_node = utils.get_node_at_cursor()
  while (curr_node) do
    local start_row, start_col, end_row, end_col = curr_node:range()
    local found_node = nil
    local parent_node = false
    for id,node in query:iter_captures(curr_node,0, start_row, end_row) do
      if (query.captures[id] == 'root') then
        -- check that the match is still on cursor as scope expands
        -- i outside, then there is not match under cursor, so break
        -- parent_node = true
        parent_node = is_cursor_in_node(node,0)
        if not parent_node then
          return nil
        end
      end
      if (query.captures[id] == target) then
        found_node = node
      end
    end
  if (found_node and parent_node) then
    return found_node
  end
  curr_node = curr_node:parent()
end
end

local function select_query_object(query, target, inner)
  local node = query_at_cursor(query, target)
  if node then
    if inner then
      set_visual_selection(offset_inner_range(node:range()))
    else
      set_visual_selection(node:range())
    end
  end
end

local function select_function(target, inner)
  select_query_object(function_query, target, inner)
end


api.nvim_set_keymap('v', 'ifn', ':lua require("custom-text-objects.node-select").select_function("name",false)<cr>',opts)
api.nvim_set_keymap('v', 'ifp', ':lua require("custom-text-objects.node-select").select_function("parameters",true)<cr>',opts)
api.nvim_set_keymap('v', 'afp', ':lua require("custom-text-objects.node-select").select_function("parameters",false)<cr>',opts)
api.nvim_set_keymap('o', 'ifn', ':lua require("custom-text-objects.node-select").select_function("name",false)<cr>',opts)
api.nvim_set_keymap('o', 'ifp', ':lua require("custom-text-objects.node-select").select_function("parameters",true)<cr>',opts)
api.nvim_set_keymap('o', 'afp', ':lua require("custom-text-objects.node-select").select_function("parameters",false)<cr>',opts)
return {query_at_cursor = query_at_cursor, select_function = select_function}

