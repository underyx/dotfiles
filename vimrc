set nocompatible

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'bling/vim-airline'  " fancy status bar
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'  " the silver searcher, for quickly searching code in project
Plug 'ctrlpvim/ctrlp.vim'  " quick switching to other files
Plug 'vim-scripts/argtextobj.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " relative line numbers in normal mode
Plug 'wakatime/vim-wakatime'  " automatic time tracking
Plug 'vim-scripts/indentpython.vim'  " better indentation for Python code
call plug#end()

" silent! ignores errors; needed to not fail when first installing base16
silent! colorscheme nord
set background=dark
syntax on

set hlsearch        " switch on highlighting of the last used search pattern
set laststatus=2    " always display the status line (from powerline)
set showtabline=2   " always display tabs (even when there's just one)
set noshowmode      " disable e.g. '--insert--' at the bottom since
            " powerline makes that redundant
set backspace=indent,eol,start  " allow backspacing over stuff in insert mode
set backup      " keep a backup file (restore to previous version)
set undofile        " keep an undo file (undo changes after closing)
set mouse=a     " enable mouse control
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set number              " show line numbers
set cursorline          " highlight current line
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set encoding=utf-8

set directory=~/.vimtmp,. " keep swap files in this directory
set backupdir=~/.vimtmp,. " keep backups in this directory
set undodir=~/.vimtmp,.   " keep undo files in this directory

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Remap up/down to moving up/down visually (not skipping over wrapped text)
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

augroup vimrc
  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                      \:call <SID>StripTrailingWhitespaces()
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal textwidth=79
  autocmd FileType python setlocal autoindent
  autocmd FileType python setlocal fileformat=unix
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
           \ | wincmd p | diffthis

let g:airline_powerline_fonts = 1  " Use powerline patched fonts in status bar
let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>u :GundoToggle<CR>

nnoremap <leader>a :Ag

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s:\s\+$::e
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <C-f> :%!python3 -m json.tool<CR>
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
