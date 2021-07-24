call plug#begin('~\AppData\Local\nvim\plugged')

" Airline
Plug 'vim-airline/vim-airline'

"Sneak
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

"Vim smooth scrolling
Plug 'psliwka/vim-smoothie'

" Nerdcommenter
Plug 'preservim/nerdcommenter'

call plug#end()

"" General
" Remap leader key to space
nnoremap <SPACE> <Nop>
let mapleader = " "

:set nu rnu
:set tabstop=4
:set shiftwidth=4
:set ignorecase
:set smartcase
:set formatoptions-=cro " Prevent continuation of comments

"General windows settings
nnoremap <C-W>m <C-W>\| <C-W>_
nnoremap <C-W>w <C-W>=

" General settings but for COC
set hidden
set nobackup
set nowritebackup
set noswapfile

" Clear highlight
nmap <leader>ch :<C-U>noh<cr>

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

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
nnoremap <silent><nowait> <leader>cs :<C-u>CocList -I symbols<cr> 
nnoremap <silent><nowait> <leader>cr  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <leader>cn  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>cp  :<C-u>CocPrev<CR>

nnoremap <silent><nowait> <leader>o :<C-u>CocCommand clangd.switchSourceHeader<cr> 
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent><nowait> <leader>rn <Plug>(coc-rename)
nmap <silent><nowait> <leader>qf <Plug>(coc-fix-current)
nnoremap <silent><nowait> <leader>ad :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>ao :<C-u>CocList outline<cr>

set cmdheight=2
set updatetime=300

""Vim fugitive
let g:fugitive_git_executable = '"C:\\Program Files ^(x86^)\\Git\\cmd\\git.exe"'

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"" Theming - Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

"" Vim-smoothie
let g:smoothie_speed_linear_factor = 11

"" Vim sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1 " Case insensitive search

"" Vim airline
let g:airline#extensions#tabline#enabled = 1

"" Nerdcommenter
filetype plugin on
