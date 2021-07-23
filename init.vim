call plug#begin('~\AppData\Local\nvim\plugged')

" Airline
Plug 'vim-airline/vim-airline'

" Sneak
Plug 'justinmk/vim-sneak'

" Telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf' , { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"" General
:set rnu
:set tabstop=4
:set shiftwidth=4

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" Remap leader key to space
nnoremap <SPACE> <Nop>
let mapleader = " "

"" Telescope
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" FZF
" Needed on windows, or else it finds and tries to use it
let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"" COC
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Theming - Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
