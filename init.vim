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
" Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'
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
set clipboard=unnamedplus
set completeopt=menuone,noselect
set t_Co=256
set number relativenumber
set hidden
set ic
set nocompatible
set tabstop=4
set encoding=UTF-8
set shiftwidth=2
set softtabstop=2
set scrolloff=2
set splitbelow
set splitright
set list listchars=tab:\>\ ,trail:*,extends:>,precedes:<
set expandtab
set noswapfile
let mapleader= " "
if has('GuiPopupmenu')
  au VimEnter * GuiPopupmenu 0
endif

"" Status Line
" set statusline=%!luaeval('require([[treeline]]).get_treeline()') 
" set statusline+=\ %n\           " buffer number
" set statusline+=\ %M\                       " modified [+] flag
" set statusline+=%f\ -\ %y\ %{FugitiveHead()} 
" set statusline+=%{&paste?'\ PASTE\ ':''}
" set statusline+=%{&spell?'\ SPELL\ ':''}
" set statusline+=%#CursorIM#     " colour
" set statusline+=%R                        " readonly flag
" set statusline+=%#Cursor#               " colour
" set statusline+=%#CursorLine#     " colour
" set statusline+=%=                          " right align
" set statusline+=%#CursorLine#   " colour
" set statusline+=\ %Y\                   " file type
" set statusline+=%#CursorIM#     " colour
" set statusline+=\ %3l:%-2c\         " line + column
" set statusline+=%#Cursor#       " colour

"" Global Variables
let g:python3_host_prog = $PYTHON
let g:vim_projects_path = $VIMROOT . '/projects/projects.txt'
let g:terminal_config =[{'load_command': 'npm run local', 'push_command': 'npm run local'},{ 'push_command': ''}]

"" Style
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

"""" Mappings
""" General
"" Custom Text Objects
onoremap in( :<c-u>silent! normal! f(vi(
vnoremap in( <esc>f(vi(
onoremap in) :silent! normal! f(vi(<cr>
vnoremap in) <esc> f(vi(
onoremap il( :silent! normal! F)vi(<cr>
vnoremap il( <esc> F)vi(
onoremap il) :silent! normal! F)vi(<cr>
vnoremap il) <esc> F)vi(
onoremap an( :silent! normal! f(va(<cr>
vnoremap an( <esc> f(va(
onoremap an) :silent! normal! f(va(<cr>
vnoremap an) <esc> f(va(
onoremap al( :silent! normal! F)va(<cr>
vnoremap al( <esc> F)va(
onoremap al) :silent! normal! F)va(<cr>
vnoremap al) <esc> F)va(

"" Disable Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <Tab> :
vnoremap <Tab> :

"" Colemak Navigation
"" Quick Window Switching
nnoremap <A-n> <C-w>j
nnoremap <A-h> <C-w>h
nnoremap <A-e> <C-w>k
nnoremap <A-i> <C-w>l

"" Alt Keys
nnoremap <A-o> o<esc>
nnoremap <A-O> O<esc>
nnoremap <A-l> :set hls!<CR>
nnoremap <A-s> :set spell!<CR>

"" Misc
nnoremap _ :split<CR>
nnoremap - :vsplit<CR>

"" '\' Operates as a kind of secondary leader.
nnoremap <bslash>p :ProjectMenu<CR>

"" Quickfix
nnoremap <C-q>o :bot copen<CR>
nnoremap <C-q>i :bot cclose<CR>
nnoremap <C-q>n :cnext<CR>
nnoremap <C-q>e :cprevious<CR>


""" Leader Key Maps
"" Search
" nnoremap <Leader>s :%s//g<left><Left>
" nnoremap <Leader>s :s//g<left><Left>
nnoremap <Leader>S :'{,'}s//g<left><Left>
nnoremap <Leader>r :Rg -i ""<Left>
nnoremap <Leader>R :Rg<Space>

"" Buffer Controls
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

"" Tab
" nnoremap <Leader>v :tabnew<CR>
" nnoremap <Leader>t gt
" nnoremap <Leader>T gT
" let g:ctrlp_map = '<Leader>p'
" nnoremap <Leader>P \:CtrlP<CR>
nnoremap <leader>p <cmd>Telescope find_files<cr>
"" Window Size
nnoremap <Leader>_ :resize +15<CR>
nnoremap <Leader>+ :resize -15<CR>
nnoremap <Leader>= :vertical resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>

"" Git
nnoremap <Leader>gt :G<Space>
nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gs :call GitAddAndCheck()<CR>
nnoremap <Leader>gp :Git pull<CR>
nnoremap <Leader>gP :Git pull --all<CR>
nnoremap <Leader>gu :Git push<CR>
nnoremap <Leader>ga :Git status<CR>
nnoremap <Leader>gf :Git fetch<CR>
nnoremap <Leader>gF :Git fetch --all<CR>
nnoremap <Leader>gb :G blame<CR>
nnoremap <Leader>gm :Magit<CR>
nnoremap <Leader>gc :call GitCommit("")<Left><Left>
nnoremap <Leader>go :G checkout<Space>
nnoremap <Leader>ge :G merge<Space>
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gi :diffget //3<CR>
" nnoremap <Leader>gU :Git push --all<CR> "This is a bit dangerous

"" CoC
" nmap <silent> <Leader>D <Plug>(coc-diagnostic-prev)
" nmap <silent> <Leader>d <Plug>(coc-diagnostic-next)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gD \<Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

"" NERD Tree
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>or :NERDTreeFind<CR>

"" Formatting
xmap <leader>f  :PrettierPartial<CR>
nmap <leader>f  :PrettierPartial<CR>
xmap <leader>ff :Prettier<CR>
nmap <leader>ff :Prettier<CR>


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

"" MISC
nnoremap <Leader>a ggVG
nnoremap <Leader>. @:

""" Imap
"" Snipmate remap
" imap <C-n> <Plug>snipMateNextOrTrigger
" smap <C-n> <Left><Right><Plug>snipMateNextOrTrigger
" imap <C-e> <Plug>snipMateShow
" smap <C-n> <Left><Right><Plug>snipMateNextOrTrigger
" inoremap <C-s> <C-r>"
" snoremap <C-s> <C-r>"

"" Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <TAB> 
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"" Misc
nnoremap <Leader>y :TerminalTabToggle<CR> 


""" Command Mode


"""" Abbreviations
""" General
iabbrev mes Zachary Scott
iabbrev mef Zachary Douglas Scott
iabbrev dates <C-R>=strftime("%Y-%m-%d")<CR>
iabbrev datet <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

""" JS
function JSAbbrev()
  iabbrev <buffer> rt return
  iabbrev <buffer> fn function
  iabbrev <buffer> ext export
  iabbrev <buffer> cnt constructor
  iabbrev <buffer> pre private
  iabbrev <buffer> pbl public
  iabbrev <buffer> udf undefined
  iabbrev <buffer> tr true
  iabbrev <buffer> fa true
endfunction

""" TS
function TSAbbrev()
  iabbrev <buffer> st String
  iabbrev <buffer> num number
endfunction

"""" Custom Commands
command! Reload execute ":so $XDG_CONFIG_HOME/nvim/init.vim"
command! Config execute ":e $XDG_CONFIG_HOME/nvim/init.vim"

"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat,/node_modules/*

"let g:livepreview_previewer = 'zathura'

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

"""" plugin configuration
""" nerd tree
let NERDTreeMapOpenExpl="E" " free up the 'e' key to be used for something else
let NERDTreeMenuUp="e"
let nerdtreemenudown='n'
let nerdtreemapopensplit='j'
let nerdtreeminimalui = 1
let nerdtreedirarrows = 1
let g:nerdtreechdirmode = 2

augroup nerd_tree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:nerdtree") && b:nerdtree.istabtree()) | q | endif
augroup end

""" coc settings
let g:coc_global_extensions = [
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-angular',
      \]

function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

""" snipmate
let g:snipmate = { 'snippet_version' : 1 }

""" Ctrl-P
let g:ctrlp_custom_igrnoe = 'node_modules\|git'
let g:ackprg = 'rg --vimgrep --smart-case'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

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

""" Vimrc Folding
function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"""" ') >= 0
    return '>1'
  endif
  if match(s:thisline, '^""" ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^"" ') >= 0
    return '>3'
  endif
  return '='
endfunction

function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = ' ◇ '.getline(v:foldstart)[5:]
  elseif v:foldlevel == 2
    let s:line = '  ●  '.getline(v:foldstart)[4:]
  elseif v:foldlevel == 3
    let s:line = '   ▪ '.getline(v:foldstart)[3:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

augroup fold_vimrc
  autocmd!
  autocmd FileType vim nnoremap <buffer> <CR> za
  autocmd FileType vim
        \ setlocal foldmethod=expr |
        \ setlocal foldexpr=VimFolds(v:lnum) |
        \ setlocal foldtext=VimFoldText() |
  "              \ set foldcolumn=2 foldminlines=2
augroup END
