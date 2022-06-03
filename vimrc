set nocompatible
set backspace=indent,eol,start

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals
set laststatus=2 " Status on regardless of number windows (good for airline)
set backspace=indent,eol,start

let g:UseTrueColor = 0
if has('gui_running')
  set guifont=Monospace\ 12
  set guioptions-=m
  set guioptions-=T
  let g:UseTrueColor = 1
else
  if filereadable(expand('~/.truecolor'))
    if &term =~ 'tmux'
        set t_8f=[38;2;%lu;%lu;%lum
        set t_8b=[48;2;%lu;%lu;%lum
    endif
    set termguicolors
    let g:UseTrueColor = 1
  endif
endif

if g:UseTrueColor == 1
  colorscheme northsky
  let g:airline_theme='luna'
else
  let g:solarized_termcolors=256
  colorscheme solarized
  let g:airline_theme='solarized'
endif

set expandtab
set history=50
set hlsearch
set hid
set number
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=0
set modeline

" map Control-K and Control-J to previous and next buffers,
" " respectively; this requires the 'set hid', above to
" " work in a good way.
noremap <C-k> :bp<CR>
inoremap <C-k> <Esc>:bp<CR>
noremap <C-j> :bn<CR>
inoremap <C-j> <Esc>:bn<CR>

"Completion menu support, but no preview (hard to read)
set completeopt=longest,menu

if has("autocmd")
  filetype plugin on
  filetype indent on

  " Jump to last editted position
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  " For all text files set 'textwidth' to 72 characters.
  autocmd FileType text setlocal textwidth=72

  " Special settings for ChangeLogs
  au FileType changelog set tw=66 noet preserveindent copyindent

  " Special settings for makefiles
  au BufNewFile,BufRead *user_customizations*.GNU set ft=make
  au BufNewFile,BufRead *makeinclude.macros set ft=make
  au BufNewFile,BufRead need.macros set ft=make
  au BufNewFile,BufRead *akefile* set ft=make
  au FileType make set noet
  au FileType make set noai

  au FileType python set tabstop=4
  au FileType python set shiftwidth=4
  au FileType python3 set tabstop=4
  au FileType python3 set shiftwidth=4

  " Set *.ipp to cpp files
  au BufNewFile,BufRead *.ipp set ft=cpp
endif

set tags=./tags;/,~/.vim/stl.tags

set mp=make

" conque options
let g:ConqueTerm_Color = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_TERM = &term

function OpenIDE()
  execute ":tabnew"
  execute ":NERDTree"
  execute ":TagbarOpen"
  execute ":wincmd l"
  execute ":tabprevious"
  execute ":tabclose"
endfunction
command -nargs=0 OpenIDE :call OpenIDE()

function SetBright()
    execute "set background=light"
    execute "colorscheme morning"
    execute "AirlineTheme understated"
endfunction
command -nargs=0 SetBright :call SetBright()

let g:ycm_confirm_extra_conf = 0
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_auto_hover = ''
nmap <leader>D <plug>(YCMHover)

let doSetBright=$bright
if doSetBright == 1
    call SetBright()
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#csv#column_display = 'Name'

let g:ctrlp_max_files = 0
let g:ctrlp_by_filename = 1

" C/C++ whitespace at EOL errors
let c_space_errors = 1

" supertab
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

let g:SimpylFold_docstring_preview = 1
set foldlevelstart=99

" pyflake8
let python_highlight_all=1

let g:syntastic_python_checkers = ["flake8"]

if filereadable($HOME."/.work")
  let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]((\.(git|hg|svn))|js)$',
      \}
endif

