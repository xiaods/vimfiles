" vimrc
" Author: Tommy Xiao
" Source: https://github.com/xiaods/vimfiles

" ----------
" Leader key
" ----------
let mapleader = ","
let maplocalleader = "."

" -------
" BUNDLES
" -------
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-markdown'
Plugin 'lyuts/vim-rtags'
Plugin 'vim-scripts/ctags.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'fatih/vim-go'
Plugin 'buoto/gotests-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()  " required
filetype plugin indent on    " required

" Default color theme
colorscheme smyck

" ------------
" VIM SETTINGS
" ------------
set nocompatible
set autoindent
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set expandtab
set foldcolumn=0
set foldlevel=9
set foldmethod=indent
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set gdefault
set laststatus=2
set list
set listchars=trail:·
set modelines=5
set nobackup
set noeol
set nofoldenable
set noswapfile
set number
set numberwidth=4
set ruler
set shell=/bin/bash
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set tabstop=2
set softtabstop=2
set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set textwidth=78
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.gitkeep,.DS_Store
set textwidth=79
set formatoptions=n
set colorcolumn=79
set tw=79
set t_Co=256
set iskeyword-=_

if $TMUX == ''
    set clipboard+=unnamed
endif

if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=m " no menus
    set guioptions-=r " no scrollbar on the right
    set guioptions-=R " no scrollbar on the right
    set guioptions-=l " no scrollbar on the left
    set guioptions-=b " no scrollbar on the bottom
    set guioptions=aiA
    set mouse=v
endif
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12

" Autocommands depending on file type
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace

syntax on

" --------
" MAPPINGS
" --------

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" jump way
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

imap jk <ESC>
nnoremap ; :

" Search
nmap <Space> /
nnoremap / /\v
vnoremap / /\v

" Clear search
nnoremap <leader><space> :noh<cr>

" Saving and buffer stuff
nmap <leader><ESC> :q!<CR>
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>

" Switch between / delete buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bufdo bd<CR>

" Splits
nnoremap <leader>v :vs<CR> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Paste mode
set pastetoggle=<F2>

" Git blame
vmap <leader>gb :Gblame<CR>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ----------------
" PLUG-IN SETTINGS
" ----------------

" React JSX syntax highlighting and indenting
let g:jsx_ext_required = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1

" TComment
map <Leader>co :TComment<CR>

" Ctags
" You can use Ctrl-] to jump to a function.... Ctrl-t will jump back
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" CtrlSpace
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceSearchTiming = 500
nnoremap <silent><C-p> :CtrlSpace O<CR>
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

"  NERDtree
nmap <silent> <leader>p :NERDTreeToggle<cr>%

" Surround
" ,' switches ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 必要配置2--错误标注（和SyntasticStatuslineFlag()配合）
let g:syntastic_error_symbol = 'EE'
let g:syntastic_style_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'WW'
let g:syntastic_style_warning_symbol = 'W>'

" 不需要手动调用 SyntasticSetTocList. 默认1
let g:syntastic_always_populate_loc_list = 1
" 自动拉起关闭错误窗口.
" 0不自动. 1自动拉起关闭. 2 自动关闭. 3 自动拉起 默认2, 建议为1
let g:syntastic_auto_loc_list = 1
" 打开文件时做语法检查, 默认 0
let g:syntastic_check_on_open = 1
" 报错时做语法检查, 默认 1
let g:syntastic_check_on_wq = 0

" 对输出做排序, 默认1
let g:syntastic_sort_aggregated_errors=1

" 输出错误来源. 默认1
let g:syntastic_id_checkers=1
" 在命令行显示当前行的错误信息. 默认1
let g:syntastic_echo_current_error=1
" 行号左边显示错误标记. 默认1
let g:syntastic_enable_sign=1
" 鼠标悬停时显示当前行错误信息. 默认1, 改为0
let g:syntastic_enable_balloons=0
" 开启错误信息语法高亮, 默认1
let g:syntastic_enable_highlighting=1

" --------------------
" CUSTOM CONFIGURATION
" --------------------

" javascript
let javascript_enable_domhtmlcss = 1

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" remove leave msg on title
let &titleold=getcwd()
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239

" easy paste in console
map <leader>y "*p

" Rust devel
autocmd BufNewFile,BufRead *.rs set filetype=rust
let g:rustfmt_autosave = 1
au FileType rust nmap <silent> <C-]> <Plug>(rust-def)
au FileType rust nmap <silent> <C-w><C-]> <Plug>(rust-def-vertical)
au FileType rust nmap <silent> <C-w>} <Plug>(rust-def-split)
au FileType rust nmap <silent> <C-k> <Plug>(rust-doc)
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"------------------------------------------------------------------------------
"  Vim-go
"------------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow