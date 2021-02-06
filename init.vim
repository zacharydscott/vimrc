call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': '.install.sh'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
" Plug 'dyng/ctrlsf.vim'
" Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
" Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'jremmen/vim-ripgrep'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'zdscott/vim-projects'
Plug 'zdscott/vim-terminal'
" Plug 'jceb/vim-orgmode'
call plug#end()

" Sensible Default Settings
set wildignore+=node_modules/**
set clipboard=unnamedplus
set t_Co=256
set number relativenumber
set hidden
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
set statusline=%f\ -\ %y

let mapleader= " "
let g:vim_projects_path = $VIMROOT . '/projects/projects.txt'
let g:terminal_config =[{'load_command': 'npm run local', 'push_command': 'npm run local'},{ 'push_command': ''}]


" disable arrow ke and ':''. I Should also map on visual mode but there is a
" complication with the 'i' operator.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap : <nop>
vnoremap : <nop>
nnoremap <Del> :
vnoremap <Del> :

" This Looks quite arbitary, but I am using the Colemak keybord layout. This
" will maintain the 'hjkl' home row for my 'hnei'.
nnoremap n j
nnoremap e k
nnoremap i l

nnoremap l i
nnoremap j e
nnoremap k n

nnoremap N J
nnoremap E K
nnoremap I L

nnoremap L I
nnoremap J E
nnoremap K N

vnoremap n j
vnoremap e k
vnoremap j e
vnoremap k n

vnoremap N J
vnoremap E K
vnoremap I L

vnoremap L I
vnoremap J E
vnoremap K N

" Basic visual buffer navigation based on 'hjkl' movement.
nnoremap <C-h> <C-w>h
nnoremap <C-n> <C-w>j
nnoremap <C-e> <C-w>k
nnoremap <C-i> <C-w>l
" Rearrange Buffers.
nnoremap <A-n> <C-w>J
nnoremap <A-h> <C-w>H
nnoremap <A-e> <C-w>K
nnoremap <A-i> <C-w>L

nnoremap <A-o> o<esc>
nnoremap <A-O> O<esc>
nnoremap <C-w> <C-e>
nnoremap <C-p> <C-y>
nnoremap <C-m> <C-i>
nnoremap <C-l> :m+<CR>
nnoremap <C-y> :m-2<CR>
nnoremap <Leader>a ggVG

nnoremap _ :split<CR>
nnoremap - :vsplit<CR>

"" '\' Operates as a kind of secondary leader.
" some nonstandard but useful operators. Delete into the non default register
" if useful data is stored there. Last is to copy line without newline
nnoremap <bslash>d "ud
nnoremap <bslash>c "uc
nnoremap <bslash>x "ux
nnoremap <bslash>x "ux
nnoremap <bslash>y ^v$<Left>y
" From my plugin
nnoremap <bslash>p :ProjectMenu<CR>

" Quickfix
nnoremap <C-c>o :bot copen<CR>
nnoremap <C-c>i :bot cclose<CR>
nnoremap <C-c>n :cnext<CR>
nnoremap <C-c>e :cprevious<CR>

" CMD line Remap
cnoremap <C-n> <Down>
cnoremap <C-e> <Up>

"" Leader Key Maps

" Search
nnoremap <Leader>r :%s//g<left><Left>
vnoremap <Leader>r :s//g<left><Left>
nnoremap <Leader>R :'{,'}s//g<left><Left>

" Buffer Controls
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :Rg -i ""<Left>
nnoremap <Leader>S :Rg<Space>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>v :tabnew<CR>
nnoremap <Leader>t gt
nnoremap <Leader>T gT
let g:ctrlp_map = '<Leader>p'
nnoremap <Leader>P \:CtrlP<CR>

nnoremap <Leader>j :let @j = expand("%:t")<CR>
nnoremap <Leader>J :let @j = expand("%:p")<CR>

" loader for specific directories
nnoremap <Leader>l <Plug>(coc-rename)

" Window Size
nnoremap <Leader>_ :resize +15<CR>
nnoremap <Leader>+ :resize -15<CR>
nnoremap <Leader>= :vertical resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>

" Git resolve maps
nnoremap <Leader>gt :G<Space>
nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gs :call GitAddAndCheck()<CR>
nnoremap <Leader>gp :Git pull<CR>
nnoremap <Leader>gP :Git pull --all<CR>
nnoremap <Leader>gu :Git push<CR>
nnoremap <Leader>ga :Git status<CR>
nnoremap <Leader>gf :Git fetch<CR>
nnoremap <Leader>gF :Git fetch --all<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Magit<CR>
nnoremap <Leader>gc :call GitCommit("")<Left><Left>
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gi :diffget //3<CR>
" nnoremap <Leader>gU :Git push --all<CR> "This is a bit dangerous

" COC
nmap <silent> <Leader>D <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>d <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD \<Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" NERD Tree
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>or :NERDTreeFind<CR>

" Formatting
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>ff :Prettier<CR>
nmap <leader>ff :Prettier<CR>


" Mmapping for specific macros in Angular.
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

"" Extras
nnoremap <Leader>kc :Config<CR>
nnoremap <Leader>kr :Reload<CR>
nnoremap <Leader>kp :CtrlPClearCache<CR>
" From my Plugin
nnoremap <Leader>y :TerminalTabToggle<CR> 
"" Control Maps


" TODO quickfix population
nnoremap <F9> :grep TODO <CR> :copen <CR>
nnoremap <Leader>m :call LoadQuickfix("")<Left><Left>

"" Custom Text Objects
onoremap r iw
onoremap R iW
onoremap x aw
onoremap X aW


function JSFunctionNav()
  execute ":normal! { ?\\v(['\"`].*)@<!function\<CR>"
endfunction

function JSFunctionArg()
  let lastSearch = @/
  call JSFunctionNav()
  execute ":normal! /(\<CR>vib"
  let @/ = lastSearch
endfunction

function JSFunctionName()
  let lastSearch = @/
  call JSFunctionNav()
  execute ":normal! el/\\w\<CR>viw"
  let @/ = lastSearch
endfunction

"" Auto Commands
augroup VIM
  autocmd!
  autocmd BufWritePost *.vim,*.vimrc Reload
augroup END

augroup JS_TS
  autocmd!
  autocmd FileType javascript,typescript call JSAbbrev() "just pulling into a function for readabilty
  autocmd FileType javascript,typescript onoremap af :<C-u>call JSFunctionArg()<CR>
  autocmd FileType javascript,typescript onoremap ef :<C-u>call JSFunctionName()<CR>
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

augroup NERD_TREE
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

augroup MISC
  autocmd!
  autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
  autocmd User ProjectChanged if g:NERDTree.IsOpen() | NERDTreeCWD | endif
  autocmd User ProjectChanged CtrlPClearCache
  autocmd User ProjectChanged if filereadable("./.vimrc") | execute ":so .vimrc" | endif
  autocmd TermOpen * nnoremap <buffer> - :vsplit<cr>:term<cr> | 
        \ nnoremap <Leader>q :bw!<cr> | 
    \ nnoremap <C-c> i<C-c> | 
     \ inoremap <A-n> <C-\><C-n>
augroup END
" short term
" xnoremap i, T,ot,
" onoremap i, :normal vi,<CR>
" xnoremap a, T,of,
" onoremap a, :normal va,<CR>

let NERDTreeMapOpenExpl='k'
let NERDTreeMenuDown='e'
let NERDTreeMenuUp='i'
let NERDTreeMapOpenSplit='j'
let g:NERDTreeChDirMode = 2

"" theme
colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

"" ctrl-p
let g:ctrlp_custom_igrnoe = 'node_modules\|git'

" set nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" COC settings
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-angular',
      \]

"" Snipmate remap
imap <C-e> <C-x><Plug>snipMateNextOrTrigger
smap <C-e> <Left><Right><Plug>snipMateNextOrTrigger
smap <C-i> <Left><Right><Plug>snipMateBack
imap <C-i> <Left><Right><Plug>snipMateBack
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"g:snipMate.always_choose_first
inoremap <silent><expr> <c-space> coc#refresh()

"" commands
command! Reload execute ":so $VIMROOT"
command! Config execute ":e $VIMROOT"

" Some crazy COC thing going on here
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

"" map tab for autocompletion
inoremap <silent><expr> <TAB> 
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
"" variables
let g:ackprg = 'rg --vimgrep --smart-case'

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat,/node_modules/*

"let g:livepreview_previewer = 'zathura'

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

" Small utility abbreviations
iabbrev mes Zachary Scott
iabbrev mef Zachary Douglas Scott
iabbrev dates <C-R>=strftime("%Y-%m-%d")<CR>
iabbrev datet <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

function JSAbbrev()
  iabbrev <buffer> rt return
  iabbrev <buffer> fn function
  iabbrev <buffer> ex export
  iabbrev <buffer> con constructor
  iabbrev <buffer> pr private
  iabbrev <buffer> pb public
  iabbrev <buffer> und undefined
  iabbrev <buffer> tr true
  iabbrev <buffer> fa true
endfunction

function TSAbbrev()
  iabbrev <buffer> st String
  iabbrev <buffer> num number
endfunction

let g:python3_host_prog = $PYTHON

"just for my weird windows thing
"" function space
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

function! GitAddAndCheck()
  Git add .
  Git diff --cached
endfunction

function! GitCommit(message)
  execute "Git commit -m \"".a:message."\""
endfunction
