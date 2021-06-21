"""""""""""""""""""""""""""""""""""""""""""""""""
" This is a "comfy IDE" config. Obviously I have
" a bias toward typescript, so this coc-vim
" is pefrect for getting that sweet-sweet 
" vscode functionality. Actually, I find
" coc to be even more powerful.
"""""""""""""""""""""""""""""""""""""""""""""""""


call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
"Plug 'lervag/vimtex'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

nnoremap n j
nnoremap e k
nnoremap i l
nnoremap j e
nnoremap k n
nnoremap l i

nnoremap N J
nnoremap E K
nnoremap I L
nnoremap J E
nnoremap K N
nnoremap L I
nnoremap ' /
nnoremap \ '

vnoremap n j
vnoremap e k
vnoremap i l
vnoremap j e
vnoremap k n
vnoremap l i

vnoremap N J
vnoremap E K
vnoremap I L
vnoremap J E
vnoremap K N
vnoremap L I
vnoremap ' /
vnoremap \ '

"" hotkey configurations
map <Space> <Leader>

" disable arrow key
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" change window navigation

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap > >>
nnoremap < <<

" tab navigation
nnoremap <Leader>j gt
nnoremap <Leader>k gT

" emmet shortcut
nnoremap <Leader>g, <C-Y>,

" reload nvim
nnoremap <Leader>r :Reload<CR>

"" NERD Tree
" focus nerd tree
nnoremap <Leader>nf :NERDTreeFind<CR>

map <C-n> :NERDTreeToggle<CR> 
 
""lets
" silver searcher integration with fzf
let g:ackprg = 'ag --nogroup --nocolor --column'

"" commands
"reload init.vim
command! Reload execute ":so ~/.config/nvim/init.vim"

"" theme
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

"" ctrl-p
let g:ctrlp_custom_igrnoe = 'node_modules\|git'

" set nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" basic settings
set nocompatible

"" COC settings
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-json',
	\ 'coc-angular',
	\]

"" suggested by COC for server compatibility
"set hidden
"set nobackup
"set nowritebackup
set cmdheight=2
set updatetime=300
"
"" don't give |ins-completion-menu| messages.
set shortmess+=c

"" for gutters
"set signcolumn=yes
"
"" map tab for autocompletion
inoremap <silent><expr> <TAB> 
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" to be frank I'm not sure...
function! s:check_back_space() abort
	let col = col('.') -1
	return !col || getline('.')[col - 1]=~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

""just copy/pasted
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"if has('patch8.1.1068')
"  " Use `complete_info` if your (Neo)Vim version supports it.
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <Leader>E <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>e <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
nmap <F2>  <Plug>(coc-rename)
"
"" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>ff  <Plug>(coc-format)
nmap <leader>ff  <Plug>(coc-format)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
"
"" Use <TAB> for selections ranges.
"" NOTE: Requires 'textDocument/selectionRange' support from the language server.
"" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>d
"

"" control p set wildignore+=*/.git/*,*/node_modules/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor

"" latex settings
autocmd BufWritePost *.tex :execute "! pdflatex" expand("%:t") 
"let g:livepreview_previewer = 'zathura'
	
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

set clipboard=unnamedplus
set t_Co=256
set number relativenumber
set tabstop=4
set shiftwidth=4
set encoding=UTF-8
