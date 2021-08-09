" --General ---
" Space is king
let mapleader = " "
let maplocalleader = " "

set exrc
set shortmess+=W
set termguicolors
syntax on
set backspace=indent,eol,start
set nocompatible
set nohlsearch
set ruler
set number
set nowrap
set showcmd
set incsearch
set noswapfile
set autoread
set ignorecase
set smartcase
set noerrorbells
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set backupcopy=yes
set relativenumber
set signcolumn=yes
set scrolloff=8
set hidden
hi LinrNr term=NONE
filetype plugin indent on


"--- Load plugins
source ~/.vim/rcfiles/plugins.vim

"--- Theming
autocmd ColorScheme * highlight LineNr ctermbg=NONE
autocmd ColorScheme * highlight clear SignColumn

" Pinkmare by me btw
colorscheme pinkmare

hi! MatchParen cterm=NONE,bold gui=NONE,bold  guibg=#87c095 guifg=NONE

"--- Source statusline
source ~/.vim/rcfiles/statusline.vim
"--- Source tabline
source ~/.vim/rcfiles/tabline.vim
"--- Source nvim stuff
source ~/.vim/rcfiles/nvim.vim


" -- Dev icons for nerdtree
set encoding=UTF-8
" -- Open nerdtree on leader t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1

"--- Vim Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1


"  ______                         _   _   _             
" |  ____|                       | | | | (_)            
" | |__ ___  _ __ _ __ ___   __ _| |_| |_ _ _ __   __ _ 
" |  __/ _ \| '__| '_ ` _ \ / _` | __| __| | '_ \ / _` |
" | | | (_) | |  | | | | | | (_| | |_| |_| | | | | (_| |
" |_|  \___/|_|  |_| |_| |_|\__,_|\__|\__|_|_| |_|\__, |
"                                                  __/ |
"                                                 |___/
let useformatting=1
function DoFormat() 
    if has("nvim") && g:useformatting
        lua vim.lsp.buf.formatting_sync(nil, 1000)
    endif
endfunction

if useformatting

    autocmd BufWritePre *.java  call DoFormat()
    autocmd BufWritePre *.md call DoFormat()
    autocmd BufWritePre *.js call DoFormat()
    autocmd BufWritePre *.ts call DoFormat()
    autocmd BufWritePre *.clj call DoFormat()
    autocmd BufWritePre *.html Neoformat

endif

"  _____                                
" |  __ \                               
" | |__) |___ _ __ ___   __ _ _ __  ___ 
" |  _  // _ \ '_ ` _ \ / _` | '_ \/ __|
" | | \ \  __/ | | | | | (_| | |_) \__ \
" |_|  \_\___|_| |_| |_|\__,_| .__/|___/
"                            | |        
"                            |_|
"
"Format, fucker
nnoremap <silent>ff    <cmd>Neoformat<CR><Esc>:w<CR>
"Go to Def
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.definition()<CR>
" Docs pls
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
" Params pls
inoremap <silent><C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"ReName
nnoremap <Leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>
"Explain error
nnoremap <Leader>ee    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
"Show error
nnoremap <Leader>se    <cmd>lua vim.lsp.diagnostic.goto_next { wrap = true }<CR>

nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>


nnoremap <C-n> :Files<CR>

"
"             _
"           /(_))
"         _/   /
"        //   /
"       //   /
"       /\__/
"       \O_/=-.
"   _  / || \  ^o
"   \\/ ()_) \.
"    ^^ <__> \()
"      //||\\
"     //_||_\\  ds
"    // \||/ \\
"   //   ||   \\
"  \/    |/    \/
"  /     |      \
" /      |       \
"        |
"
nnoremap <C-F> <cmd>Telescope live_grep<CR>
nnoremap <C-B> <cmd>Telescope buffers<CR>
nnoremap <C-N> <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
nnoremap <C-H> <cmd>Telescope oldfiles<CR>
nnoremap <Leader><CR> <cmd>Telescope lsp_code_actions<CR>
nnoremap <silent>gr    <cmd>Telescope lsp_references<CR>
nnoremap <Leader>gs    <cmd>Telescope git_status<CR>
" Show diagnostics
nnoremap <Leader>sd <cmd>Telescope lsp_workspace_diagnostics<CR>

" Telly colors not really working for me
highlight TelescopeSelection guifg=#FF38A2 gui=bold
highlight TelescopeMatching guifg=#d9bcef

"----------------------------

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap : :<c-g>u
inoremap ; ;<c-g>u
inoremap ; ;<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Previous file
nnoremap <Leader>pf <C-^>
" Tabbing autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"terminal remap
tnoremap <Esc> <C-\><C-n>

imap <silent> <c-p> <Plug>(completion_trigger)
