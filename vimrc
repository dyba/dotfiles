set nocompatible
filetype off " Turn this off to address an Ubuntu quirk
filetype plugin indent off

set runtimepath+=~/.vim/bundle/vundle
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#rc()

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

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/Align'
Bundle 'twerth/ir_black'
Bundle 'tpope/vim-eunuch'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'briancollins/vim-jst'
Bundle 'altercation/vim-colors-solarized'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'ervandew/supertab'
Bundle 'jnwhiteh/vim-golang'
Bundle 'elixir-lang/vim-elixir'
Bundle 'mattn/emmet-vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'digitaltoad/vim-jade'

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

set background=light
colorscheme solarized

"================= Tagbar Settings ==================="
nnoremap <leader>tbt :TagbarToggle<cr>

"================= Mustache Settings ==================="
let g:mustache_abbreviations = 1

"================= Mustache Settings ==================="
let g:user_emmet_settings = {
			\ 'erb' : {
			\   'extends' : 'html'
			\ }
			\}


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

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.rb setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.liquid setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.rake setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Rakefile setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.js setl shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.php setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.hbs setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.erb setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.md setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost Podfile setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.yml setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.json setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.scss setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.xml setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.xsd setl shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.go set noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufReadPost *.css setl shiftwidth=2 softtabstop=2 expandtab

au FileType go au BufWritePre <buffer> Fmt
