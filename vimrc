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
  highlight PmenuSel term=reverse cterm=reverse ctermfg=0 ctermbg=187 guibg=DarkGrey
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
"set modeline

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

function OpenIDE()
  execute ":tabnew"
  execute ":NERDTree"
  execute ":TagbarOpen"
  execute ":wincmd l"
  execute ":tabprevious"
  execute ":tabclose"
endfunction
command -nargs=0 OpenIDE :call OpenIDE()

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
let g:SuperTabcrMapping = 1

if filereadable($HOME."/.work")
  let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]((\.(git|hg|svn))|js)$',
      \}
endif

let test#strategy = "dispatch"

let g:ale_linters = {"python": ["flake8"]}

"let g:jedi#show_call_signatures = "2"
"set noshowmode " for jedi call sigs

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

let g:grepper = {}
let g:grepper.tools = ["ack", "git", "grep"]
let g:grepper.dir = "repo,cwd"
cabbrev Ack GrepperAck
cabbrev grep GrepperGrep
