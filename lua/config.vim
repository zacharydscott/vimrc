" temporary file as I want a simple way to resource on file save
luafile $XDG_CONFIG_HOME/nvim/lua/config.lua
luafile $XDG_CONFIG_HOME/nvim/lua/treesitter.lua
luafile $XDG_CONFIG_HOME/nvim/lua/telescopic.lua
luafile $XDG_CONFIG_HOME/nvim/lua/lsp.lua
luafile $XDG_CONFIG_HOME/nvim/lua/mappings.lua
luafile $XDG_CONFIG_HOME/nvim/lua/treeline.lua

function! LuaFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^---- ') >= 0
    return '>1'
  endif
  elseif match(s:thisline, '^--- ') >= 0
    return '>2'
  endif
  return '='
endfunction

function! LuaFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = ' ◇ '.getline(v:foldstart)[5:]
  elseif v:foldlevel == 2
    let s:line = '  ●  '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

augroup fold_lua
  " autocmd!
  " autocmd FileType lua nnoremap <buffer> <CR> za
  " autocmd FileType lua
  "       \ setlocal foldmethod=expr |
  "       \ setlocal foldexpr=LuaFolds(v:lnum) |
  "       \ setlocal foldtext=LuaFoldText() |
  " "              \ set foldcolumn=2 foldminlines=2
augroup END
