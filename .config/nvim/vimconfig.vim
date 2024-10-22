" init.vim

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Create a JSX function abbreviation
iabbrev jsxfunc export default function <C-R>=JsxFunc()<CR>
inoreabbrev modstyle className={style<C-R>=ModStyle()<CR>
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
" iabbrev html <html><C-Enter>  <head><C-Enter></head><C-Enter><body><C-Enter></body><C-Enter></html>
iabbrev contenttype 'Content-Type': 'application/json'

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>l :split \| ter bash -c 'git log -p; read'<cr>
nnoremap <leader>d :split \| ter bash -c 'git diff; read'<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>sa  :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nnoremap <leader>ya gg "*yG
nnoremap <silent> <leader>ss <CR>:set nohlsearch<CR>
nnoremap <silent> <LEFT> :vertical resize -2 <CR>
nnoremap <silent> <RIGHT> :vertical resize +2 <CR>
nnoremap <silent> <UP> :resize -2 <CR>
nnoremap <silent> <DOWN> :resize +2 <CR>
inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>

nnoremap y "ay
vnoremap y "ay
nnoremap pp "ap
vnoremap pp "ap

nnoremap d "dd
vnoremap d "dd
nnoremap pd "dp
vnoremap pd "dp
nnoremap c "cc
vnoremap c "cc
nnoremap pc "cp
vnoremap pc "cp
nnoremap x "xx
vnoremap x "xx
nnoremap px "xp
vnoremap px "xp

nnoremap p "ap
vnoremap p "ap

nnoremap <Leader>c 0i//<Esc>

function! JsxFunc()
    let funcname = input("Function name: ")
    return funcname . '() {}'
endfunction

function! ModStyle()
    let style = input("Class name: ")
    return style.'}'
endfunction


" Set tab size to 4 spaces
set tabstop=2
" Set indentation width to 4 spaces
set shiftwidth=2
" Use spaces instead of tabs for indentation
set expandtab
set path+=.,src/**
set relativenumber
set number
set nohlsearch

"Prettier 
Plug 'maxmellon/vim-jsx-pretty'

"Handlebars 
Plug 'mustache/vim-mustache-handlebars'

"Shows tab numbers, very useful
Plug 'sangdol/mintabline.vim'

"for fzf
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

"autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'pangloss/vim-javascript'

"themes to play around with
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'
Plug 'diegoulloao/neofusion.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'rebelot/kanagawa.nvim'

" Configure stylelint-lsp language server
au User lsp_setup call lspconfig#stylelint#setup({})

" Initialize plugin system
call plug#end()


set termguicolors

" set background=dark
" colorscheme kanagawa-wave " chill
" colorscheme kanagawa-lotus " light
 colorscheme kanagawa-dragon " dark
"colorscheme tokyonight
" colorscheme neofusion

autocmd FileType javascript setl formatprg=eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+$//e
autocmd FileType typescript setl formatprg=eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+$//e
autocmd FileType typescriptreact setl formatprg=eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+$//e
autocmd FileType html setl formatprg=           eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+%//e
