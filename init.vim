"      __  __   ______             ____     ____
"     /\ \/\ \ /\__  _\   /'\_/`\ /\  _`\  /\  _`\
"     \ \ \ \ \\/_/\ \/  /\      \\ \ \L\ \\ \ \/\_\
"      \ \ \ \ \  \ \ \  \ \ \__\ \\ \ ,  / \ \ \/_/_
"       \ \ \_/ \  \_\ \__\ \ \_/\ \\ \ \\ \ \ \ \L\ \
"        \ `\___/  /\_____\\ \_\\ \_\\ \_\ \_\\ \____/
"         `\/__/   \/_____/ \/_/ \/_/ \/_/\/ / \/___/
"
"""" Plugins
call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': '.install.sh'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground',
" Plug 'nvim-treeline',
Plug 'tpope/vim-fugitive'
" Plug 'kien/ctrlp.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'sharkdp/fd'
Plug 'jremmen/vim-ripgrep'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'Xuyuap/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'mattn/emmet-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

"""" External Files
" source ./custom-text.vim
so $XDG_CONFIG_HOME/nvim/lua/config.vim
"
"
"" Settings
""" Basics
set wildignore+=node_modules/**
set number relativenumber
set nocompatible
set list listchars=tab:\>\ ,trail:*,extends:>,precedes:<
set noswapfile
if has('GuiPopupmenu')
  au VimEnter * GuiPopupmenu 0
endif

"" Style
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

"" Angular Splits
nnoremap <Leader>xh :call AngularVsplitMatch("html","v")<CR>
nnoremap <Leader>xt :call AngularVsplitMatch("ts","v")<CR>
nnoremap <Leader>xd :call AngularVsplitMatch("spec.ts","v")<CR>
nnoremap <Leader>xs :call AngularVsplitMatch("scss","v")<CR>
nnoremap <Leader>xc :call AngularVsplitMatch("css","v")<CR>
nnoremap <Leader>xx :call AngularVsplitMatchDefault("v")<CR>
nnoremap <Leader>x :call AngularVsplitMatchDefault("v")<CR>

nnoremap <Leader>XH :call AngularVsplitMatch("html","h")<CR>
nnoremap <Leader>XT :call AngularVsplitMatch("ts","h")<CR>
nnoremap <Leader>XD :call AngularVsplitMatch("spec.ts","h")<CR>
nnoremap <Leader>XS :call AngularVsplitMatch("scss","h")<CR>
nnoremap <Leader>XC :call AngularVsplitMatch("css","h")<CR>
nnoremap <Leader>XX :call AngularVsplitMatchDefault("h")<CR>
nnoremap <Leader>X :call AngularVsplitMatchDefault("h")<CR>

nnoremap <Leader>zh :call AngularVsplitMatch("html","n")<CR>
nnoremap <Leader>zt :call AngularVsplitMatch("ts","n")<CR>
nnoremap <Leader>zd :call AngularVsplitMatch("spec.ts","n")<CR>
nnoremap <Leader>zs :call AngularVsplitMatch("scss","n")<CR>
nnoremap <Leader>zc :call AngularVsplitMatch("css","n")<CR>
nnoremap <Leader>zz :call AngularVsplitMatchDefault("n")<CR>
nnoremap <Leader>z :call AngularVsplitMatchDefault("n")<CR>

"" Meta Shortcuts
nnoremap <Leader>kc :Config<CR>
nnoremap <Leader>ks :SnipMateOpenSnippetFiles<CR>
nnoremap <Leader>kr :Reload<CR>
nnoremap <Leader>km :SearchMap<Space>
nnoremap <Leader>kp :CtrlPClearCache<CR>

"" Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

"""" plugin configuration
""" nerd tree

augroup nerd_tree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:nerdtree") && b:nerdtree.istabtree()) | q | endif
augroup end

""" Emmet
let g:user_emmet_leader_key="<c-y>"
"""" File Auto Commands
augroup VIM
  autocmd!
  autocmd BufWritePost *.vim,*.vimrc,~/.config/nvim/*.lua Reload
augroup END

augroup HTML
  autocmd!
  autocmd FileType html onoremap aa :normal F<Space>v2f"<CR>
  autocmd FileType html onoremap ia :normal T<Space>f"ivf"h<CR>
augroup END

augroup MD
  autocmd!
  autocmd FileType md onoremap ab :normal ?\*\*<CR>v/\*\*<CR><Right><Right>
  autocmd FileType md onoremap ib :normal ?\*\*<CR><Right><Right>v/\*\*<CR>
  autocmd FileType md onoremap ai :normal F*vf*<CR>
  autocmd FileType md xnoremap ai :normal F*vf*<CR>
  autocmd FileType md onoremap ii :normal DD?\*<CR><Right><Right>v/\*<CR>
augroup END


augroup MISC
  autocmd!
  " autocmd BufEnter * lua require'completion'.on_attach()
  autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
  autocmd User ProjectChanged if g:NERDTree.IsOpen() | NERDTreeCWD | endif
  autocmd User ProjectChanged CtrlPClearCache
  autocmd User ProjectChanged if filereadable("./.vimrc") | execute ":so .vimrc" | endif
  autocmd TermOpen * nnoremap <buffer> - :vsplit<cr>:term<cr> | 
        \ nnoremap <Leader>q :bw!<cr> | 
        \ nnoremap <C-c> i<C-c> | 
        \ inoremap <A-n> <C-\><C-n>
augroup END

"""" Functions
""" Angular Split
function! AngularVsplitMatch(targ, direction)
  let path = substitute(expand("%"),"\.[A-z]*$",".".a:targ,"")
  if (a:direction =~ "v")
    execute "vsplit ".path
  elseif (a:direction =~ "h")
    execute "split ".path
  else
    execute "e ".path
  endif
endfunction

function! AngularVsplitMatchDefault(direction)
  if (match(expand("%"),"\.html$") =~ -1)
    call AngularVsplitMatch("html", a:direction)
  else
    call AngularVsplitMatch("ts", a:direction)
  endif
endfunction

""" Git Shortcuts
function! GitAddAndCheck()
  Git add .
  Git diff --cached
endfunction

function! GitCommit(message)
  execute "Git commit -m \"".a:message."\""
endfunction
