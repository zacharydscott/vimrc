local function map_match(matcher,buf)
  local match_len = string.len(matcher)
  local alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.\'";:[](){}<>!@#$%^&*'
  local lines = vim.api.nvim_buf_get_lines(buf,0,-1,false)
  local res = ""
  for c in alphabet:gmatch"." do
    local isMatch = false
    for _,l in pairs(lines) do
      l = string.gsub(string.lower(l),'%a%s*'..string.lower(matcher),'')
      if (string.sub(l,1,1) == c) then
        isMatch = true
        break
      end
    end
    if (not isMatch) then
      res = res..c
    end
  end
  return res
end

local function better_map_buffer(map_start,mode)
  local buf = vim.api.nvim_create_buf(true,true)
  local mappings = vim.api.nvim_exec(mode..'map ', true)
  lines = {}
  for l in mappings:gmatch("(.-)\n") do
    if (string.match(string.lower(l),'^%a%s*'..string.lower(map_start))) then
      table.insert(lines,l)
    end
  end
  vim.api.nvim_exec('sbuffer '..buf, true)
  vim.api.nvim_buf_set_lines(buf,0,table.getn(lines),false,lines)
  vim.api.nvim_buf_set_lines(buf,0,1,false,{'No mappings on '..map_start..' for: '..map_match(map_start,buf)})
end

return  {
  better_map_buffer = better_map_buffer
}

