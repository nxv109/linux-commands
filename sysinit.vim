" set theruntime path to include Vundle and initialize
set hidden
set autochdir
set encoding=UTF-8
filetype plugin on
set omnifunc=syntaxcomplete#Complete
""syntax on
map q <Nop>

"Tu dong cap nhat file khi file thay doi boi chuong trinh khac
set autoread
set autowrite

set clipboard^=unnamed
:imap <C-Space> <C-X><C-O>

autocmd Filetype gitcommit setlocal spell

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'tsony-tsonev/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'ap/vim-buftabline'
Plugin 'morhetz/gruvbox'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leshill/vim-json'
"Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'townk/vim-autoclose'
Plugin 'valloric/youcompleteme'
Plugin 'nikvdp/ejs-syntax'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'marijnh/tern_for_vim'
call vundle#end()
" required
"---------------------------------------------------------------------
" prevent vim from giving a warning it the swp file is open
let g:airline_powerline_fonts = 1
set shortmess=A
"set foldmethod=syntax
set cursorline
set encoding=utf8
set ignorecase
set nobackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set virtualedit=onemore
nmap <C-A-b> :Autoformat<CR>

let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1

" auto close tag
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" auto refresh nertree
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" ctrlp
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" -----------------------------------------------------------------------------------------
set laststatus=0
" -----------------------------------------------------------------------------------------
" This sets the color scheme
set background=dark
"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme palenight
"colorscheme onehalf
"colorscheme base16
"colorscheme dracula
colorscheme gruvbox
if (has("nvim"))
   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
   set termguicolors
endif
" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]

" -----------------------------------------------------------------------------------------
" scrolling up and down multiple lines atonce
:nmap <c-j> +3
:vmap <c-j> +3
:nmap <c-k> -3
:vmap <c-k> -3
:nmap <c-Up> -3
:nmap <c-Down> +3
:vmap <c-Up> -3
:nmap <c-Down> +3
" -----------------------------------------------------------------------------------------
" autocomplete
let g:ycm_global_ycm_extra_conf = '$HOME/config_files/nvim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
set backspace=indent,eol,start
" -----------------------------------------------------------------------------------------
" other editor settings
set number
set mouse=a
set tabstop=2
set shiftwidth=3

" next and prev tabs
nnoremap <F2> :bprev<CR>
nnoremap <F3> :bnext<CR>


" setting indent markers-------------------------------------------------------------------
set listchars=tab:\|\
set list

" -----------------------------------------------------------------------------------------
" Prettier
"map <C-A-f> :Prettier<CR>
" Nerd Tree file manager
" open a NERDTree automatically when vim starts up if no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=30
map <C-f> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=0 " closes upon opening a file in nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^node_modules$']
"
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
	  NERDTreeFind
	  wincmd p
   endif
endfunction
" -----------------------------------------------------------------------------------------
" save
:nmap <c-s> :w<CR>

" start the terminal in the given path by typing :t on the minibuffer
:ab t :!urxvt -bg black --geometry 85x47+683+0&\|<CR>
" -----------------------------------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" -----------------------------------------------------------------------------------------
" toggling between insert, normal and visual mode upon triple key press
:imap vv <Esc>v
:nmap vv <Esc>v
:imap <c-l> <Esc>la
:nmap <c-l> e
:nmap <c-h> b
:nmap <C-Right> e
:imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:!rxvt-unicode -bg black --geometry 85x47+683+0 -e sh -c "make && make run; bash"&<CR>\|<CR>
:nmap <c-x><c-x> :update<CR>\|<Esc>:!rxvt-unicode -bg black --geometry 85x47+683+0 -e sh -c "make && make run; bash"&<CR>\|<CR>
" -------------------------------------------------------------------------------
" latex stuff
filetype plugin on
filetype indent on
let g:tex_flavor='latex'

" -------------------------------------------------------------------------------
"changes cursor color between insert mode and normal mode
if &term =~ "xterm\\|urxvt"
   " use an orange cursor in insert mode
   let &t_SI = "\<Esc>]12;green\x7"
   " use a red cursor otherwise
   let &t_EI = "\<Esc>]12;red\x7"
   silent !echo -ne "\033]12;red\007"
   " reset cursor when vim exits
   autocmd VimLeave * silent !echo -ne "\033]112\007"
   " use \003]12;gray\007 for gnome-terminal and urxvt up to version 9.21
endif

au BufReadPost *
		 \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
		 \ execute("normal `\"") |
		 \ endif

""pangloss/vim-javascript noi bat syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

""ALE ESlint javascript

let g:ale_fixers = {
		 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
		 \   'javascript': ['eslint'],
		 \}
let g:ale_fix_on_save = 0
" Enable completion where available.
let g:ale_completion_enabled = 1

"Syntasic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1
" AIRLINE
"Tự động hiển thị tất cả bộ đệm khi chỉ có một tab mở.
let g:airline#extensions#tabline#enabled = 1
"định dạng đường dẫn
let g:airline#extensions#tabline#formatter = 'default'
"" ES6 Syntax Highlight
augroup filetype javascript syntax=javascript
   let g:jsx_ext_required = 1 " Allow JSX in normal JS files
   ""Auto save
   let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

   ""Emmet
   let g:mta_filetypes = {
			\'javascript.jsx' : 1,
			\}
   ""asyncrun
   "autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

   let verbose=1

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" terminal
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-s-n> :call OpenTerminal()<CR>


" Coc nvim
" highlight
"autocmd CursorHold * silent call CocActionAsync('highlight')
