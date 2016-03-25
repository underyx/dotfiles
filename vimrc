set nocompatible
filetype off

set rtp+=~/.vundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" plugins to install go here
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wakatime/vim-wakatime'

call vundle#end()
filetype plugin indent on

colorscheme base16-chalk
set background=dark
syntax on

set hlsearch		" switch on highlighting of the last used search pattern
set laststatus=2	" always display the status line (from powerline)
set showtabline=2	" always display tabs (even when there's just one)
set noshowmode		" disable e.g. '--insert--' at the bottom since
			" powerline makes that redundant
set backspace=indent,eol,start	" allow backspacing over stuff in insert mode
set backup		" keep a backup file (restore to previous version)
set undofile		" keep an undo file (undo changes after closing)
set mouse=a		" enable mouse control
set history=50 		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set number              " show line numbers
set cursorline          " highlight current line
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

set directory=~/.vim/tmp,. " keep swap files in this directory
set backupdir=~/.vim/tmp,. " keep backups in this directory
set undodir=~/.vim/tmp,.   " keep undo files in this directory

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

let g:airline_powerline_fonts = 1  " Use powerline patched fonts with vim-airline
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
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
