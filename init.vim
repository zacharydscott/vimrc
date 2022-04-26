"      __  __   ______             ____     ____
"     /\ \/\ \ /\__  _\   /'\_/`\ /\  _`\  /\  _`\
"     \ \ \ \ \\/_/\ \/  /\      \\ \ \L\ \\ \ \/\_\
"      \ \ \ \ \  \ \ \  \ \ \__\ \\ \ ,  / \ \ \/_/_
"       \ \ \_/ \  \_\ \__\ \ \_/\ \\ \ \\ \ \ \ \L\ \
"        \ `\___/  /\_____\\ \_\\ \_\\ \_\ \_\\ \____/
"         `\/__/   \/_____/ \/_/ \/_/ \/_/\/ / \/___/
"
" au BufWinLeave <buffer> lua require('float-term'):handle_term_close()
let s:python3_host_prog = expand('$USERPROFILE\venv\neovim3\Scripts\python.exe')
if filereadable(fnameescape(s:python3_host_prog))
  let g:python3_host_prog = fnameescape(s:python3_host_prog)
elseif filereadable(fnameescape('bin/python3.10'))
  let g:python3_host_prog = fnameescape('bin/python3.10')
else
  unlet! g:python3_host_prog
endif
" let g:python3_host_prog="C://Users//wb549004//AppData//Local//Microsoft//WindowsApps//PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0/python3.9.exe"
"""" Plugins
"lua vim.g.nvim_tree_follow = 1
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground',
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'nvim-treeline',
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'sharkdp/fd'
Plug 'jremmen/vim-ripgrep'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install}}
Plug 'mattn/emmet-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'SirVer/ultisnips'
Plug 'hrsh7th/nvim-compe'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'zacharydscott/float-term.nvim'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'zacharydscott/hatchet.nvim'
" Plug 'tmsvg/pear-tree'
" Plug 'ObserverOfTime/coloresque.vim'
call plug#end()

 
"""" External Files
" source ./custom-text.vim
so $XDG_CONFIG_HOME/nvim/lua/config.vim
lua require('config')
"
"
"" Settings
""" Basics
let g:nvcode_termcolors=256
let USER_NAME = 'Zachary Scott'
hi link FloatTermDefaultTab Normal
hi link FloatTermSelectTab Cursor
" hi link FloatTermDefaultTab Normal |hi link FloatTermSelectTab Cursor
syntax on
colorscheme gruvbox
cnoreabbrev h vert bo h

" checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif
set autoindent noexpandtab tabstop=4 shiftwidth=4
set wildignore+=node_modules/**
set number
set number relativenumber
set nocompatible
set list listchars=tab:\ \ \|,trail:*,extends:>,precedes:<
set noswapfile
set wrap
let g:nvcode_termcolors=256

" set statusline= %t

set statusline=\ %#CursorColumn#%{FugitiveHead()}\%#Normal#\ %t\ %m\ %=\ %y\ %l:%c\ 

syntax on
colorscheme nvcode " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
	set termguicolors
	hi LineNr ctermbg=NONE guibg=NONE
endif
" augroup GuiPopupmenu
" 	au VimEnter * GuiPopupmenu 0
" augroup end
let g:UltiSnipsExpandTrigger="<C-t>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let json_count = 0

augroup FLOAT_TERMINAL
	au TermClose * let a = 'b'
augroup END
"" Style
" colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

"" Angular Splits
nnoremap n j
nnoremap e k
nnoremap i l

nnoremap N J
nnoremap E K
nnoremap I L

nnoremap j e
nnoremap k n
nnoremap l i

nnoremap J E
nnoremap K N
nnoremap L I

vnoremap n j
vnoremap e k
" vnoremap i l

vnoremap N J
vnoremap E K
" vnoremap I L

vnoremap j e
vnoremap k n
" vnoremap l i

vnoremap J E
vnoremap K N
" vnoremap L I

nnoremap gn gj
nnoremap ge gk
nnoremap gi gl

nnoremap gN gJ
nnoremap gE gK
nnoremap gI gL

nnoremap gj ge
nnoremap gk gn
nnoremap gl gi

nnoremap gJ gE
nnoremap gK gN
nnoremap gL gI

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

onoremap ia i(
onoremap aa a(
onoremap ir i{
onoremap ar a{
onoremap iz i<
onoremap az a<
onoremap ix i[
onoremap ax a[

vnoremap lja :<c-u>call NextPair('(',')','i',0)<cr>
onoremap lja :<c-u>call NextPair('(',')','i',1)<cr>
vnoremap aja :<c-u>call nextPair('(',')','a',0)<cr>
onoremap aja :<c-u>call NextPair('(',')','a',1)<cr>

vnoremap ljr :<c-u>call NextPair('{','}','i',0)<cr>
onoremap ljr :<c-u>call NextPair('{','}','i',1)<cr>
vnoremap ajr :<c-u>call NextPair('{','}','a',0)<cr>
onoremap ajr :<c-u>call NextPair('{','}','a',1)<cr>

vnoremap ljx :<c-u>call NextPair('[',']','i',0)<cr>
onoremap ljx :<c-u>call NextPair('[',']','i',1)<cr>
vnoremap ajx :<c-u>call NextPair('[',']','a',0)<cr>
onoremap ajx :<c-u>call NextPair('[',']','a',1)<cr>

vnoremap ljz :<c-u>call NextPair('<','>','i',0)<cr>
onoremap ljz :<c-u>call NextPair('<','>','i',1)<cr>
vnoremap ajz :<c-u>call NextPair('<','>','a',0)<cr>
onoremap ajz :<c-u>call NextPair('<','>','a',1)<cr>

vnoremap lia :<c-u>call LastPair('(',')','i',0)<cr>
onoremap lia :<c-u>call LastPair('(',')','i',1)<cr>
vnoremap aia :<c-u>call LastPair('(',')','a',0)<cr>
onoremap aia :<c-u>call LastPair('(',')','a',1)<cr>

vnoremap lir :<c-u>call LastPair('{','}','i',0)<cr>
onoremap lir :<c-u>call LastPair('{','}','i',1)<cr>
vnoremap air :<c-u>call LastPair('{','}','a',0)<cr>
onoremap air :<c-u>call LastPair('{','}','a',1)<cr>

vnoremap lix :<c-u>call LastPair('[',']','i',0)<cr>
onoremap lix :<c-u>call LastPair('[',']','i',1)<cr>
vnoremap aix :<c-u>call LastPair('[',']','a',0)<cr>
onoremap aix :<c-u>call LastPair('[',']','a',1)<cr>

vnoremap liz :<c-u>call LastPair('<','>','i',0)<cr>
onoremap liz :<c-u>call LastPair('<','>','i',1)<cr>
vnoremap aiz :<c-u>call LastPair('<','>','a',0)<cr>
onoremap aiz :<c-u>call LastPair('<','>','a',1)<cr>

nnoremap <Leader>/ :set opfunc=SearchObject<cr>g@

function! SearchObject(a)
	let save = @"
	normal! `[v`]y
	let @/ = @"
	let @" = save
endfunction

function! NextPair(ch1,ch2,in,omap)
	let l:search = @/
	execute "normal! /".a:ch1.""
	let @/ = l:search
	if a:omap && matchstr(getline('.'), '\%'.(col('.')+1).'c.') == a:ch2
		normal! a<space><esc>
	endif
	execute "normal! v".a:in.a:ch1
endfunction

function LastPair(ch1,ch2,in,omap)
	let l:search = @/
	execute "normal! ?".a:ch1.""
	let @/ = l:search
	if a:omap && matchstr(getline('.'), '\%'.(col('.')-1).'c.') == a:ch1
		normal! i<space><esc>
		return
	endif
	execute "normal! v".a:in.a:ch1
endfunction

"" Meta Shortcuts
" nnoremap <Leader>kc :Config<CR>
" nnoremap <Leader>ks :SnipMateOpenSnippetFiles<CR>
" nnoremap <Leader>kr :Reload<CR>
" nnoremap <Leader>km :SearchMap<Space>
" nnoremap <Leader>kp :CtrlPClearCache<CR>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

"""" plugin configuration

""" Emmet
let g:user_emmet_leader_key="<C-Y>"
"""" File Auto Commands
augroup VIM
  autocmd!
  autocmd BufWritePost *.tex execute(':! pdflatex '..@%)
  " autocmd BufWritePost *.lua :luafile %
augroup END

augroup HTML
  autocmd!
  autocmd FileType html onoremap aa :normal F<Space>v2f"<CR>
  autocmd FileType html vnoremap aa :normal F<Space>v2f"<CR>
  autocmd FileType html onoremap ia :normal T<Space>f"ivf"h<CR>
  autocmd FileType html vnoremap ia :normal T<Space>f"ivf"h<CR>
augroup END

augroup MD
  autocmd!
  autocmd FileType md onoremap ab :normal ?\*\*<CR>v/\*\*<CR><Right><Right>
  autocmd FileType md onoremap ib :normal ?\*\*<CR><Right><Right>v/\*\*<CR>
  autocmd FileType md onoremap ai :normal F*vf*<CR>
  autocmd FileType md xnoremap ai :normal F*vf*<CR>
  autocmd FileType md onoremap ii :normal DD?\*<CR><Right><Right>v/\*<CR>
augroup END

set cursorline
hi cursorline cterm=none term=none
augroup CURSOR_LINE
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
augroup END
highlight CursorLine guibg=#333333 ctermbg=234
highlight Cursor guibg=#333333 ctermbg=234

augroup MISC
  autocmd!
  " autocmd BufEnter * lua require'completion'.on_attach()
  autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
  autocmd User ProjectChanged CtrlPClearCache
  autocmd User ProjectChanged if filereadable("./.vimrc") | execute ":so .vimrc" | endif
  " autocmd TermOpen * nnoremap <buffer> - :vsplit<cr>:term<cr> | 
  "       \ nnoremap <Leader>q :bw!<cr> | 
  "       \ nnoremap <C-c> i<C-c> | 
  "       \ inoremap <A-n> <C-\><C-n>
" augroup END
function! True_False_Toggle()
	let l:old=@"
	let l:pos = getpos('.')
	normal! yiw
	let @" = get({'false': 'true', 'true': 'false', 'False': 'True', 'True': 'False'}, @", 'fail')
	if @" ==# 'fail'
		normal! 
		let @"=l:old
		return
	endif
	normal! viwp
	let @"=l:old
	call setpos('.',l:pos)
	return
endfunction

nnoremap <c-a> :call True_False_Toggle()<CR>

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

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

hi link FloatTermDefaultTab Normal
hi link FloatTermSelectTab Cursor
hi link FloatBorder NONE
" hi Search guibg=#FAE060
