set nocompatible
filetype off " Turn this off to address an Ubuntu quirk
filetype plugin indent off

set runtimepath+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Change the default font type
set guifont=Menlo\ Regular\:h16

" Convert tabs to 2 spaces
"set softtabstop=2

" Using the shift commands (<<, >>) shifts the line by 2 spaces
" to the left or right, respectively
"set shiftwidth=2

" Set line numbers
set number

" Turn highlighted search
set hls

" Follow the cursor with a horizontal line across the screen
set cursorline

" Display commands as they are being typed
set showcmd

" Function to toggle between relative and absolute line numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Launching MacVim will show a steelblue horizontal line
" Launching vim will show a lightgray horizontal line
highlight CursorLine guibg=#545454 ctermbg=lightgray

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/VimClojure'
Plugin 'vim-scripts/Align'
Plugin 'twerth/ir_black'

Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-projectionist'
" Working with word variants
Plugin 'tpope/vim-abolish'
" Comment out lines
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'ericpruitt/tmux.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'briancollins/vim-jst'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'digitaltoad/vim-jade'
Plugin 'wting/rust.vim'
Plugin 'groenewege/vim-less'
Plugin 'ElmCast/elm-vim'
Plugin 'slim-template/vim-slim'
Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'guns/vim-sexp'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'JulesWang/css.vim'
Plugin 'jvirtanen/vim-octave'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'junegunn/vim-easy-align'
Plugin 'machakann/vim-sandwich'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
"Plugin 'xolox/vim-lua-ftplugin'

call vundle#end()

filetype on
filetype indent on
filetype plugin indent on
syntax on " Turn on syntax highlighting by default

" Easier navigation for text that wraps in a single line
map <A-DOWN> gj
map <A-UP> gk
map <A-UP> <ESC>gki
map <A-DOWN> <ESC>gji

"=================     LEADER KEYS      ==================="
" Create a leader, i.e. prefix key, using the '-' character
let mapleader = ","
" Create a local leader key using the backslash character;
" don't forget to escape
" let maplocalleader = "\\"

"================= NORMAL MODE MAPPINGS ==================="
" Follow the wisdom of the ages: never recurse a mapping
" Use the '-' key to move the current line down
noremap <leader>- Vdp
" Use the '_' key to move the current line up
noremap <leader>_ VdkP
" Use the '>' key to shift the current line to the right
" noremap > V>
" Use the '<' key to shift the current line to the left
" noremap < V<
" Delete the current line
nnoremap <leader>d dd
" Delete the current line and enter insert mode
nnoremap <leader>c ddO
" Edit your .gvimrc file in a split window
nnoremap <leader>eg :vsplit $MYGVIMRC<cr>
" Source your .gvimrc file
nnoremap <leader>sg :source $MYGVIMRC<cr>
" Edit your .vimrc file in a split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source your .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
" Toggle between absolute numbers and relative numbers
nnoremap <leader>n :call NumberToggle()<cr>
" Toggle between displaying highlighted results
nnoremap <leader>hl :set hlsearch!<cr>

let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

set background=dark
colorscheme zenburn

"================= Tagbar Settings ==================="
nnoremap <leader>tb :TagbarToggle<cr>

"================= Mustache Settings ==================="
let g:mustache_abbreviations = 1

"================= Mustache Settings ==================="
let g:user_emmet_settings = {
			\ 'erb' : {
			\   'extends' : 'html'
			\ }
			\}

"================= elm-vim Settings ==================="
let g:elm_format_autosave = 1

"================= CtrlP Settings ==================="
nnoremap <leader>. :CtrlP<cr>
nnoremap <leader>cc :CtrlPClearCache<cr>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Always display the statusline in all windows
set laststatus=2

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': ['\v\.(exe|so|dll)$', 'tags$'],
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore the local node_modules folder generated by npm
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules$'
  \ }

"============== NERDTree Settings ================"
nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

au FileType go nmap <leader>r <Plug>(go-run)

au BufNewFile,BufReadPost *.c setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.py setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.rb setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.liquid setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.rake setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.feature setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Rakefile setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Berksfile setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Gemfile  setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.gemspec setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Guardfile  setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.thor setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost [vV]agrantfile setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Makefile setl shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab
au BufNewFile,BufReadPost *.js setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost .babelrc setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.json setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 softtabstop=2 expandtab

au BufNewFile,BufReadPost *.html setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.sql setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.php setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.hbs setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.erb setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.md setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Podfile setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.yml setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.scss setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.sass setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.xml setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.xsd setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.go set noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufReadPost *.css setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.tpl :set ft=php

" Python files
au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 autoindent expandtab fileformat=unix
" YAML files
au BufNewFile,BufRead *.yaml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79 autoindent expandtab fileformat=unix

au BufNewFile,BufRead [vV]agrantfile set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Berksfile set filetype=ruby
au BufNewFile,BufRead *.thor set filetype=ruby
au BufNewFile,BufRead *.gemspec set filetype=ruby

autocmd BufNewFile,BufReadPost *.template setl shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.template set filetype=javascript

augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

au BufNewFile,BufReadPost *.m,*.oct setl shiftwidth=2 softtabstop=2 expandtab
