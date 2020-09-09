" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set rtp+=~/.vim/bundle/Vundle.vim

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
set mouse=a		" Enable mouse usage (all modes) in terminals
set laststatus=2 " Status on regardless of number windows (good for airline)

let g:UseTrueColor = 0
if has('gui_running')
  set guifont=Monospace\ 12
  set guioptions-=m
  set guioptions-=T
  let g:UseTrueColor = 1
else
  if &term =~ 'tmux'
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors 
    let g:UseTrueColor = 1
  elseif &term =~ 'xterm-256color' || &term =~ 'screen-256color'
    set termguicolors 
    let g:UseTrueColor = 1
  endif
endif

if g:UseTrueColor == 1
  colorscheme northsky
  let g:airline_theme='luna'
else
  colorscheme elflord
  let g:airline_theme='jellybeans'
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
set softtabstop=0
set modeline

set cinoptions=
  " Line up case label with the switch {}
  set cinoptions+=:0
  " align with a case label instead of statement after it
  set cinoptions+=l1
  " align class scope declarations with {}
  set cinoptions+=g0
  " put function return type declaration up against margin
  set cinoptions+=t0
  " indent a continuation 4 characters
  set cinoptions+=+4
  " use 4 characters for indenting unclosed parenthesis
  set cinoptions+=(4
  set cinoptions+=u4
  " special handling for when parenthesis is by itself
  set cinoptions+=U1
  " search for unclosed paranthesis at most 100 lines away
  set cinoptions+=)100
  " search for unclosed comment at most 100 lines away
  set cinoptions+=*100

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

if filereadable("Makefile")
  set mp=make
elseif filereadable("wscript") || filereadable("wscript_build")
  let wafscript = findfile("waf", ".;")
  let &makeprg=wafscript
elseif filereadable("SConstruct") || filereadable("SConscript")
  set mp=scons
else
  let makefile = findfile("Makefile", ".;")
  if filereadable(makefile) && filereadable(expand("~/bin/mymake"))
    set mp=mymake
  endif
endif

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
let g:ctrlp_custom_ignore = 'node_modules\|build'
