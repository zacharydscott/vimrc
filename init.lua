--   ___      ________       ___      _________          ___           ___  ___      ________
--  |\  \    |\   ___  \    |\  \    |\___   ___\       |\  \         |\  \|\  \    |\   __  \
--  \ \  \   \ \  \\ \  \   \ \  \   \|___ \  \_|       \ \  \        \ \  \\\  \   \ \  \|\  \
--   \ \  \   \ \  \\ \  \   \ \  \       \ \  \         \ \  \        \ \  \\\  \   \ \   __  \
--    \ \  \   \ \  \\ \  \   \ \  \       \ \  \    ___  \ \  \____    \ \  \\\  \   \ \  \ \  \
--     \ \__\   \ \__\\ \__\   \ \__\       \ \__\  |\__\  \ \_______\   \ \_______\   \ \__\ \__\
--      \|__|    \|__| \|__|    \|__|        \|__|   \|__|  \|_______|    \|_______|    \|__|\|__|

vim.g.user_emmet_leader_key="<A-y>"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"kyazdani42/nvim-web-devicons",
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"tomtom/tlib_vim",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"jremmen/vim-ripgrep",
	"prettier/vim-prettier",
	"mattn/emmet-vim",
	"SirVer/ultisnips",
	"neovim/nvim-lspconfig",
	"kyazdani42/nvim-tree.lua",
	"windwp/nvim-autopairs",
	"github/copilot.vim",
	"zacharydscott/float-term.nvim",
	"zacharydscott/hatchet.nvim",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"phaazon/hop.nvim",
	"miversen33/netman.nvim",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"luisiacc/gruvbox-baby",
	"mxsdev/nvim-dap-vscode-js",
})

vim.api.nvim_exec([[
let s:python3_host_prog = expand('$USERPROFILE\venv\neovim3\Scripts\python.exe')
if filereadable(fnameescape(s:python3_host_prog))
  let g:python3_host_prog = fnameescape(s:python3_host_prog)
elseif filereadable(fnameescape('bin/python3.10'))
  let g:python3_host_prog = fnameescape('bin/python3.10')
else
  unlet! g:python3_host_prog
endif

"""" External Files
" source ./custom-text.vim
so $XDG_CONFIG_HOME/nvim/lua/config.vim
]],true)
-- require('config')
vim.api.nvim_exec([[
set clipboard=unnamed

let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
	augroup END
end

" map <silent> "=p :r !powershell.exe -Command Get-Clipboard<CR>
" map! <silent> <C-r>= :r !powershell.exe -Command Get-Clipboard<CR>

" noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>

"" Settings
""" Basics
let g:nvcode_termcolors=256
let USER_NAME = 'Zachary Scott'
let g:copilot_enabled = 1
" hi link FloatTermDefaultTab Normal
" hi link FloatTermSelectTab Cursor
" hi link FloatTermDefaultTab Normal |hi link FloatTermSelectTab Cursor
syntax on
cnoreabbrev h vert bo h

" checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif
set autoindent noexpandtab tabstop=4 shiftwidth=4
set wildignore+=node_modules/**
set number
" set number relativenumber
set nocompatible
set list listchars=tab:\ \ \|,trail:*,extends:>,precedes:<
set noswapfile
set wrap
let g:nvcode_termcolors=256

" set statusline= %t

" set statusline=\ %#CursorColumn#%{FugitiveHead()}\%#Normal#\ %t\ %m\ %=\ %y\ %l:%c\ 
set laststatus=2
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" Nvim Treeline
let g:nvim_tree_icons = {
	\ 'default': "",
	\ 'symlink': "詞",
	\ 'folder': {
	\   'default': "▶",
	\   'open': "▼",
	\   'empty': "▷",
	\   'empty_open': "▽",
	\   'symlink': "詞",
	\   'symlink_open': "詞",
	\   }
	\ }

syntax on


" checks if your terminal has 24-bit color support
" if (has("termguicolors"))
" 	set termguicolors
" 	hi LineNr ctermbg=NONE guibg=NONE
" endif
" augroup GuiPopupmenu
" 	au VimEnter * GuiPopupmenu 0
" augroup end
let g:UltiSnipsExpandTrigger="<C-t>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:blamer_delay = 500
let json_count = 0

augroup FLOAT_TERMINAL
	au TermClose * let a = 'b'
augroup END
"" Style
" colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

"" Angular Splits
" nnoremap n j
" nnoremap e k
" nnoremap i l
" 
" nnoremap N J
" nnoremap E K
" nnoremap I L
" 
" nnoremap j e
" nnoremap k n
" nnoremap l i
" 
" nnoremap J E
" nnoremap K N
" nnoremap L I
" 
" vnoremap n j
" vnoremap e k
" " vnoremap i l
" 
" vnoremap N J
" vnoremap E K
" " vnoremap I L
" 
" vnoremap j e
" vnoremap k n
" " vnoremap l i
" 
" vnoremap J E
" vnoremap K N
" " vnoremap L I
" 
" nnoremap gn gj
" nnoremap ge gk
" nnoremap gi gl
" 
" nnoremap gN gJ
" nnoremap gE gK
" nnoremap gI gL
" 
" nnoremap gj ge
" nnoremap gk gn
" nnoremap gl gi
" 
" nnoremap gJ gE
" nnoremap gK gN
" nnoremap gL gI
" 
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
"""" File Auto Commands
augroup VIM
  autocmd!
  autocmd BufWritePost *.tex execute(':! pdflatex '..@%)
  " autocmd BufWritePost *.lua :luafile %
augroup END

augroup JS
  autocmd!
  autocmd BufWritePre *.ts :Prettier<CR>
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
" hi cursorline cterm=none term=none
augroup CURSOR_LINE
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
augroup END
" highlight CursorLine guibg=#292929 ctermbg=234
" highlight Cursor guibg=#292929 ctermbg=234 guifg=#000000 ctermfg=Black

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

"augroup ColorSchemeWatcher
"    autocmd!
"    autocmd ColorScheme * call MakeColorChanges()
"augroup END

function! RemoveItalicFromHighlightCommand(somestring)
    let cmd=a:somestring
    " Samples:
    " cterm=italic
    " gui=bold,italic
    " gui=bold,italic,underline
    " gui=italic,bold,underline
    " gui=
    let cmd=substitute(cmd, "italic",    "", "g") " remove italics
    let cmd=substitute(cmd, ",,",       ",", "g") " when italic occurs in middle of list, delete extraneous comma
    let cmd=substitute(cmd, ", ",       " ", "g") " when italic at end of list, delete extraneous comma
    let cmd=substitute(cmd, "gui\= ",   " ", "g") " when italic is only item in list, delete arg to avoid error
    let cmd=substitute(cmd, "cterm\= ", " ", "g") " when italic is only item in list, delete arg to avoid error
    let cmd=substitute(cmd, "term\= ",  " ", "g") " when italic is only item in list, delete arg to avoid error
    return cmd
endfunction

function! MakeColorChanges()
    redir @a | silent hi | redir END
    let @a=substitute(@a, "xxx", "", "g") " The :hi command displays 'xxx' to show what the groups look like
    let cmdlist = split(@a, "\n")
    call filter(cmdlist, 'v:val =~ "italic"')
    call map(cmdlist, 'RemoveItalicFromHighlightCommand(v:val)')
    for cmd in cmdlist
        let groupname=split(cmd, " ")[0]
        execute "hi clear ".groupname
        execute "hi default ".cmd
    endfor
endfunction

function! True_False_Toggle()
	let l:old=@"
	let l:pos = getpos('.')
	normal! yiw
	let @" = get({'false': 'true', 'true': 'false', 'False': 'True', 'True': 'False', '||': '&&', '&&': '||', '|': '&'}, @", 'fail')
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
    execute "edit ".path
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

"" colorscheme gruvbox
" hi link FloatTermDefaultTab Normal
" hi link FloatTermSelectTab Cursor
" hi link FloatBorder NONE
" hi Search guibg=#FAE060
 hi TelescopeNormal guibg=#313131
hi Terminal guibg=#313131
]],true)
vim.cmd.filetype("on")
vim.cmd.filetype("plugin on")
vim.g.gruvbox_baby_telescope_theme = 1;
require('config')
