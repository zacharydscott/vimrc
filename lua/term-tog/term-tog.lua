api = vim.api
v = vim.v

local M = {}

local function M:create_terminal()
  local buf = api.nvim_create_buf(v.false, v.true)
  api.nvim_buf_set_lines(buf,0,-1,v.true,['test','text'])
  local opts = { relative = 'cursor', width = 10, height = 2, col = 0, row = 1}
  local win = api.nvim_open_win(buf,0,opts)
  api.nvim_win_set_option(win, 'winhl')
end

M:create_terminal()

return M

