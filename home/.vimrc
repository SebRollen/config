syntax on
filetype plugin indent on
set nocompatible

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set number
set relativenumber
set wildmenu
set lazyredraw
set showmatch
set cursorline
set hidden " Hide buffers rather than delete them

set hlsearch
set ignorecase
set incsearch
set smartcase

set formatoptions+=w

nnoremap j gj
nnoremap k gk

let mapleader=","

set noerrorbells
set title
set autoread
set history=1000
set backspace=indent,eol,start
set undofile
set undodir=~/.vim/undodir
set directory=~/.vim/swapfiles
set undolevels=1000
set termguicolors

" never fold
set foldlevel=9999
set nofoldenable

" enable italics
set t_ZH=[3m
set t_ZR=[23m

" autocomplete options
set completeopt=menu,menuone,preview,noselect,noinsert

" https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Make cursor into vertical bar in INSERT mode
 if exists('$TMUX')
    let &t_SI.="\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\" "SI = INSERT mode
    let &t_SR.="\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\" "SR = REPLACE mode
    let &t_EI.="\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\" "EI = NORMAL mode (ELSE)
else
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'mcchrish/nnn.vim' " File navigator
Plug 'dense-analysis/ale' " Linting
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rails'
Plug 'strboul/urlview.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'ziglang/zig.vim'
Plug 'junegunn/goyo.vim' " Full screen writing mode
Plug 'junegunn/limelight.vim' " Highlight current line. For use with GOyo
Plug 'skanehira/gh.vim'
Plug 'danobi/prr', {'rtp': 'vim/'}
Plug 'tpope/vim-rhubarb'
call plug#end()

colorscheme nord

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:snips_author="Sebastian Rollen"

let g:nnn#set_default_mappings=0
let g:nnn#layout={'window': {'width': 0.9, 'height': 0.6}}
let g:nnn#command='nnn -oA'

function! s:goyo_enter()
  set linebreak
  set spell spelllang=en_us
endfunction

function! s:goyo_leave()
  set nolinebreak
  set nospell
endfunction

augroup writing
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END


nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:rustfmt_autosave=1

let g:ale_linters = {'javascript': ['eslint'], 'rust': ['analyzer', 'cargo']}
let g:ale_fixers = {'eruby': ['erblint'], 'ruby': ['standardrb', 'rubocop'], 'javascript': ['stylelint', 'eslint'], 'rust': ['rustfmt']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_set_highlights = 1
highlight ALEError ctermbg=none ctermfg=red cterm=underline
highlight ALEWarning ctermbg=none ctermfg=yellow cterm=underline
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
highlight clear SignColumn
highlight Comment cterm=italic

let g:LanguageClient_serverCommands = {'ruby': ['~/.rbenv/shims/solargraph', 'stdio'], 'rust': ['rust-analyzer'] }
let g:ale_completion_enabled=1

nnoremap <leader>n :NnnPicker %:p:h<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :RG<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>u :Urlview<CR>
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Centered search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap K :ALEHover<CR>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" esc in insert & visual mode
inoremap jk <esc>
inoremap kj <esc>
vnoremap jk <esc>
vnoremap kj <esc>

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"Automatically set up highlighting for `.prr` review files
"Use `:hi` to see the various definitions we kinda abuse here
augroup Prr
  autocmd!
  autocmd BufRead,BufNewFile *.prr set syntax=on

  "Make prr added/deleted highlighting more apparent
  autocmd BufRead,BufNewFile *.prr hi! link prrAdded DiffAdd
  autocmd BufRead,BufNewFile *.prr hi! link prrRemoved DiffDelete
  autocmd BufRead,BufNewFile *.prr hi! link prrFile Special

  "Make file delimiters more apparent
  autocmd BufRead,BufNewFile *.prr hi! link prrHeader Directory

  "Reduce all the noise from color
  autocmd BufRead,BufNewFile *.prr hi! link prrIndex Special
  autocmd BufRead,BufNewFile *.prr hi! link prrChunk Special
  autocmd BufRead,BufNewFile *.prr hi! link prrChunkH Special
  autocmd BufRead,BufNewFile *.prr hi! link prrTagName Special
  autocmd BufRead,BufNewFile *.prr hi! link prrResult Special
augroup END

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
