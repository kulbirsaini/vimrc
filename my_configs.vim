" Scrolling
set mouse=n
set scrolloff=7
" Vim Tab Navigation
nmap <Tab> :tabnext <CR>
nmap <s-tab> :tabp <CR>
nmap <C-A> :tabn 1 <CR>
set tabpagemax=100

try
    unmap <leader>tn
    unmap <leader>t<leader>
catch
endtry

" Some function keys
nmap <F5> :w<CR>
imap <F5> <Esc>:w<CR>

" Toggle NERDTree
map <C-X> :NERDTreeToggle<CR>

" Sets how many lines of history VIM has to remember
set history=5000

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
call NERDTreeHighlightFile('py', 'white', 'none', '#ff00ff', '#151515')

" Fuzzy Finder
map <C-T> :tabe<CR>:FufFile<CR>

" Don't add EOF at end of file
set noendofline

" Tabs
set expandtab 
autocmd FileType javascript set tabstop=2 | set shiftwidth=2
" Indent of 1 tab with size of 4 spaces
set tabstop=4
set shiftwidth=4

" Don't save backups of files.
set nobackup
set backupcopy=yes

" No extra margin on left
set foldcolumn=0

" Background and color schmeme
set background=dark
colorscheme dracula "slate

" Disable automatic code folding
function! JavaScriptFold()
endfunction

function! CoffeeScriptFold()
endfunction

" JSX Highlighting
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" Automatically install vim plug https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Tab completion scrolling for supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim_runtime/my_plugins/plugged')

" The ultimate tab completion
Plug 'ervandew/supertab'

" Pyenv with jedi-vim
" Plug 'lambdalisue/vim-pyenv'

" Syntax checking
" Plug 'vim-syntastic/syntastic'

" Python indentation (especially the opening braces on new line)
Plug 'vim-scripts/indentpython.vim'

" Python highlighting
Plug 'vim-python/python-syntax'

" PHP-Twig
" Plug 'lumiliet/vim-twig'

" PHP
" Plug 'StanAngeloff/php.vim'

" Blade
" Plug 'jwalton512/vim-blade'

" Markdown
" Plug 'tpope/vim-markdown'

" XML Edit
" Plug 'sukima/xmledit'

" Javascript
" Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" Tailwind
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall coc-tailwindcss coc-json coc-tsserver

" Fuzzy Finder
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'

" Initialize plugin system
call plug#end()

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color GNU screen.
  set t_ut=
endif
