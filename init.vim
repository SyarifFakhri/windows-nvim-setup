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

" FZF 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Gruvbox
Plug 'morhetz/gruvbox'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Vim fugitive
Plug 'tpope/vim-fugitive'

call plug#end()

"" General
:set nu rnu
:set tabstop=4
:set shiftwidth=4
:set smartcase

" General settings but for COC
set hidden
set nobackup
set nowritebackup
set noswapfile

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
" nnoremap <leader>p <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" FZF
" Set the path of fzf
set rtp+=~/.fzf 
nmap <leader>p <cmd>FZF<cr>

"" COC
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Search the whole project for symbols
nnoremap <silent><nowait> <space>cs :<C-u>CocList -I symbols<cr> 
nnoremap <silent><nowait> <space>cr :<C-u>CocResume<cr> 
nnoremap <silent><nowait> <space>o :<C-u>CocCommand clangd.switchSourceHeader<cr> 
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

""Vim fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :diffget :G<CR>

"" Theming - Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
