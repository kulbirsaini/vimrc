" Vim Tab Navigation
nmap <Tab> :tabnext <CR>
nmap <s-tab> :tabp <CR>
nmap <C-A> :tabn 1 <CR>
set tabpagemax=100

" Some function keys
nmap <F5> :w<CR>
imap <F5> <Esc>:w<CR>
nmap <F6> <Esc>:!php5.6 /home/saini/code/cpap/PHP_CodeSniffer/bin/phpcs -n --extensions=php --standard=/home/saini/code/cpap/PHP_CodeSniffer/CodeSniffer/Standards/CPAP/ --report-width=200  %:p<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" The ultimate tab completion
Plug 'ervandew/supertab'

" Pyenv with jedi-vim
Plug 'lambdalisue/vim-pyenv'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" File Structure
Plug 'scrooloose/nerdtree'

" Python indentation (especially the opening braces on new line)
Plug 'vim-scripts/indentpython.vim'

" Python highlighting
Plug 'vim-python/python-syntax'

" Most Recently Used Files :MRU, t to open in new tab, o to open in new window
Plug 'vim-scripts/mru.vim'

" PHP-Twig
Plug 'lumiliet/vim-twig'

" PHP
Plug 'StanAngeloff/php.vim'

" Blade
Plug 'jwalton512/vim-blade'

" Markdown
Plug 'tpope/vim-markdown'

" XML Edit
Plug 'sukima/xmledit'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" Tailwind
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-tailwindcss'

" Surrouding words/sentences cs"'
Plug 'tpope/vim-surround'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy Finder
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'

" Tabular
Plug 'godlygeek/tabular'

Plug 'dracula/vim', { 'as': 'dracula' }

" Initialize plugin system
call plug#end()

colorscheme dracula


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Disable Python docstring window for jedi-vim
autocmd FileType python setlocal completeopt-=preview

" Syntax checker settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Python syntax highlights
let g:python_highlight_all = 1

" NERDTree Specific settings
" Close vim when only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
map <C-X> :NERDTreeToggle<CR>

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" PHP Syntax
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Airline
let g:airline_theme='zenburn'

" Fuzzy Finder
map <C-T> :tabe<CR>:FufFile<CR>

""""""""""""""""""""""""""""""""""
" NON PLUGIN SETTINGS AFTER THIS "
""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set cindent
set autoindent
set smartindent
set undolevels=1000
set mouse=n
set scrolloff=3

" Automatically setting options in various files
set modeline

" Don't add EOF at end of file
set noendofline

" matching braces
set showmatch
set matchtime=2
set matchpairs+=<:>

" time out on mapping after one second, time out on key codes after
" a tenth of a second
set timeout timeoutlen=1000 ttimeoutlen=100

" The screen will not be redrawn while executing macros, registers
" and other commands that have not been typed. To force an updates use |:redraw|.
set lazyredraw

" set dictionary
set dictionary=/usr/share/dict/words

syntax enable
filetype on
filetype plugin on
filetype indent on
set expandtab 
autocmd FileType javascript set tabstop=2 | set shiftwidth=2
" Indent of 1 tab with size of 4 spaces
set tabstop=4
set shiftwidth=4

" Don't save backups of files.
set nobackup
set backupcopy=yes

set noerrorbells
set visualbell
set t_vb=

" Display full file path
set statusline+=%F

" Colors {{{
set background=dark
hi StatusLine   term=bold,reverse cterm=bold,reverse 					ctermbg=Black
hi StatusLineNC term=reverse      cterm=reverse
hi User1        term=inverse,bold cterm=inverse,bold ctermfg=Red
hi User2        term=bold         cterm=bold         ctermfg=Yellow
hi User3        term=inverse,bold cterm=inverse,bold ctermfg=Blue
hi User4        term=inverse,bold cterm=inverse,bold ctermfg=LightBlue
hi User5        term=inverse,bold cterm=inverse,bold ctermfg=Red       	ctermbg=Green
hi Folded       term=standout     cterm=bold         ctermfg=Black 		ctermbg=White
hi FoldColumn   term=standout                        ctermfg=DarkCyan  	ctermbg=Black 
hi Comment      term=bold                            ctermfg=DarkCyan
" }}}

" Set filetypes
augroup filetypedetect
    au BufRead,BufNewFile *.module set filetype=php
augroup END

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color GNU screen.
  set t_ut=
endif
