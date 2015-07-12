" set default 'runtimepath' (without ~/.vim folders)
" let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

set nocompatible
set hidden
set autoread

syntax on
set synmaxcol=150 " don't use syntax highlighting on lines longer than 150

filetype plugin on
filetype indent on
set number
set nowrap
set title
set nobackup
set nowb
set noswapfile
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set copyindent
set confirm
set splitright
set splitbelow
set scrolloff=4
set shell=/bin/zsh
set cinoptions=t0,+4,(4,u4,w1
set novisualbell
set noerrorbells
set ignorecase
set smartcase
set lazyredraw
set showmatch
set incsearch " do incremental searching
set hlsearch
set magic

set wildignore=*.pyc,*.o,*~
set wildmenu
set wildmode=full

autocmd BufWritePre * :%s/\s\+$//e "this causes the cursor to jump...
nmap gg g*N
nmap s :w <enter>
nmap Q :q <enter>
nmap cw ciw
nmap <Up> :<Up>
nmap <Left> :bp<CR>
nmap <Right> :bn<CR>

" visual mappings

" move lines up and down with arrow keys
vnoremap <Up> :move '<-2<CR>gv
vnoremap <Down> :move '>+1<CR>gv
vnoremap < <gv
vnoremap > >gv
vnoremap s :%s/

"
"highlight Search cterm=NONE ctermfg=Blue ctermbg=Red
inoremap <C-U> <C-G>u<C-U>

" paste with indentation formatted

" leader mappings "
let mapleader=" "
set foldmethod=manual
nmap ; :
map <leader>o :CtrlP<CR>
nnoremap <leader>f :ls<CR>:b<Space>
nmap <silent> <leader>/ :let@/ =""<CR>

" copy and past "
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" navigation mappings "
nnoremap j gj
nnoremap k gk

nnoremap ciq ci"

map <tab> %
noremap ! :mksession! s <CR> :qall!<enter>
noremap H ^
noremap L $
inoremap jk <ESC>
vnoremap . :norm.<CR>
set t_Co=256
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-q> <C-w>q

" imap {<CR> {<CR><BS>}<ESC>O

" tab stuff
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

syntax enable

" colorscheme PaperColor
colorscheme atom-dark-256

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions+=c
    set guioptions-=r " no scrollbars
    set guioptions-=l " no scrollbars
    set guioptions-=R " no scrollbars
    set guioptions-=L " no scrollbars
    set t_Co=256
    set guitablabel=%M\ %t

    " no blinking cursor
    set guicursor+=a:lCursor/lCursor-blinkon0
    set guifont=Monaco:h14

endif
"let g:solarized_visibility = "high"
""let g:solarized_termcolors = 256
"let g:solarized_contrast = "high"
"call togglebg#map("<F5>")

let g:ctrlp_switch_buffer=0
" let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_working_path_mode = 'ra'

au VimResized * exe "normal! \<c-w>="

" EasyMotion "
map <leader> <Plug>(easymotion-prefix)

" silence annoying youcompleteme warnings
let g:ycm_global_ycm_extra_conf='~..ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui=0

"""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-complete' }
Plug 'jpalardy/vim-slime'
call plug#end()

" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airlie_theme='PaperColor'

set fillchars=vert:\ ,

" easymotion options
map <Leader> <Plug>(easymotion-prefix)

" slime options
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
nmap <CR> <Plug>SlimeLineSend
vmap <CR> <Plug>SlimeRegionSend

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
" function! AutoHighlightToggle()
"   let @/ = ''
"   if exists('#auto_highlight')
"     au! auto_highlight
"     augroup! auto_highlight
"     setl updatetime=4000
"     return 0
"   else
"     augroup auto_highlight
"       au!
"       au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"       hi Search guibg=Grey guifg=Black
"     augroup end
"     setl updatetime=0
"     return 1
"   endif
" endfunction
" call AutoHighlightToggle()
