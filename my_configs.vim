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
colorscheme peaksea

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" The ultimate tab completion
" Plug 'ervandew/supertab'

" Pyenv with jedi-vim
" Plug 'lambdalisue/vim-pyenv'

" Syntax checking
" Plug 'vim-syntastic/syntastic'

" File Structure
" Plug 'scrooloose/nerdtree'

" Python indentation (especially the opening braces on new line)
" Plug 'vim-scripts/indentpython.vim'

" Python highlighting
" Plug 'vim-python/python-syntax'

" Most Recently Used Files :MRU, t to open in new tab, o to open in new window
" Plug 'vim-scripts/mru.vim'

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
" Plug 'MaxMEllon/vim-jsx-pretty'

" Tailwind
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'iamcco/coc-tailwindcss'

" Surrouding words/sentences cs"'
" Plug 'tpope/vim-surround'

" Status Bar
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Fuzzy Finder
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'

" Tabular
" Plug 'godlygeek/tabular'

" Initialize plugin system
call plug#end()
