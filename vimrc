
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'

call plug#end()

" Mappings
:imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>


" Emmet Config
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall


" Indentation

au BufNewFile,BufRead *.py
	\ set tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=80
	\ expandtab
	\ autoindent
	\ fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

filetype on
filetype plugin on
filetype indent on
