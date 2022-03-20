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

call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mcchrish/nnn.vim' " File navigator
Plug 'dense-analysis/ale' " Linting
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'ziglang/zig.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'strboul/urlview.vim'
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:snips_author="Sebastian Rollen"

let g:nnn#set_default_mappings=0
let g:nnn#layout={'window': {'width': 0.9, 'height': 0.6, 'highlight': 'Debug'}}
nnoremap <leader>n :NnnPicker %:p:h<CR>

let g:rustfmt_autosave=1

let g:ale_linters = {'rust': ['analyzer'], 'zig': ['zls'], 'ruby': ['rubocop']}
let g:ale_linters_explicit = 1
let g:ale_fixers = {'ruby': ['standardrb', 'rubocop']}
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

let g:vimwiki_global_ext = 0

" Put diary files in same folder as rest of wiki for easier linking
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki_html/', 'diary_rel_path' : '', 'ext': '.md', 'syntax': 'markdown','auto_tags':1}]
" Disable <tab> in insert mode for vimwiki to allow for snip expansion
let g:vimwiki_key_mappings = { 'table_mappings': 0, }

nnoremap <leader>f :FZF<CR>
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

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" TODO: Fix the language client below
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
