" SECTION: Install Plugin HERE
"====================================================================
" Pluggins{{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'https://github.com/dyng/ctrlsf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/liuchengxu/nerdtree-dash'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" " Layout Management
Plug 'https://github.com/zefei/vim-wintabs-powerline.git'
Plug 'https://github.com/mtth/scratch.vim'
Plug 'https://github.com/dhruvasagar/vim-zoom'
Plug 'https://github.com/zefei/vim-wintabs.git'
Plug 'https://github.com/junegunn/vim-peekaboo'
"
" Activity Management
Plug 'https://github.com/davidoc/taskpaper.vim'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/lvht/tagbar-markdown.git'

" Editing Management{{{2
Plug 'https://github.com/matze/vim-move'
Plug 'andymass/vim-matchup'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'https://github.com/haya14busa/incsearch.vim'
Plug 'https://github.com/haya14busa/incsearch-easymotion.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'brooth/far.vim'
Plug 'junegunn/goyo.vim'


Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Cut/ Copy/ Subtitute
Plug 'https://github.com/svermeulen/vim-yoink.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/honza/vim-snippets.git'
"}}}
" Helper Management{{{2
Plug 'https://github.com/skywind3000/vim-quickui'
Plug 'liuchengxu/vim-which-key'
"}}}
" Command Management{{{2
Plug 'https://github.com/osyo-manga/vim-over'
Plug 'https://github.com/arithran/vim-delete-hidden-buffers.git'
"}}}
" Workspace Management{{{2
Plug 'https://github.com/zhimsel/vim-stay'
Plug 'https://github.com/Konfekt/FoldText'
Plug 'https://github.com/Konfekt/FastFold'
Plug 'https://github.com/MattesGroeger/vim-bookmarks.git'

"}}}
" Version Control Management{{{2
Plug 'mhinz/vim-signify'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
"}}}
" Others{{{2
Plug 'https://github.com/puremourning/vimspector'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com/liuchengxu/vim-clap.git'
Plug 'https://github.com/rizzatti/dash.vim'
Plug 'https://github.com/chrisbra/NrrwRgn/'
"}}}
" Method Management
Plug 'liuchengxu/vista.vim'
" Support File Types{{{2
Plug 'https://github.com/nelstrom/vim-visual-star-search.git'
Plug 'https://github.com/mhartington/oceanic-next.git'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'psliwka/vim-smoothie'
Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/hdima/python-syntax.git'
Plug 'https://github.com/uiiaoo/java-syntax.vim.git'
Plug 'mxw/vim-jsx'
" Text Object
Plug 'https://github.com/kana/vim-textobj-user.git'
Plug 'https://github.com/machakann/vim-textobj-delimited.git'
Plug 'https://github.com/michaeljsmith/vim-indent-object.git'
Plug 'https://github.com/glts/vim-textobj-comment.git'
Plug 'https://github.com/kana/vim-textobj-entire.git'
Plug 'https://github.com/chun-yang/vim-textobj-chunk.git'
"Language Server
Plug 'udalov/kotlin-vim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
" Treessiter
call plug#end()
"}}}1
" Linking{{{1
"====================================================================
" Linking to initial Pluggin
set runtimepath^=~/.vim runtimepath+=~/.vim/after
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIM,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set  runtimepath+=/usr/local/opt/fzf
" --------------------------------------------------------
" SETTINGS START

set completeopt=longest,menuone

" SETTINGS END
" --------------------------------------------------------

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------

let &packpath = &runtimepath
source ~/.vimrc
" source ~/GitHub/dotfiles/.vimrc
"}}}
" Abbreviation{{{1
iabbrev --. `●`
iabbrev --# `[☛]`
iabbrev #-- `[☚]`
iabbrev --p `[✏]`
iabbrev --x `[✘]`
iabbrev --v `[✔]`
iabbrev --l `⮑`
iabbrev --+ `✙`
iabbrev --^ ~~▼
iabbrev ==== ~~--------------------------------------------------------
iabbrev ++++ <tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab><tab>~~****
iabbrev bbb border: 1px solid red;


iabbrev lesn lens
iabbrev fotns fonts
iabbrev javasciprt javascript
iabbrev desciprtion description
iabbrev descirption description
iabbrev escpae escape
iabbrev charecter character
iabbrev chpter chapter
iabbrev funciton function
iabbrev satck stack
iabbrev psuh push
iabbrev sotre store
iabbrev serach search
iabbrev improt import
iabbrev Likn Link
iabbrev coulmn column
iabbrev mpa map
iabbrev tets test
iabbrev siwtch switch
iabbrev opne open
iabbrev makr make
iabbrev ntex next
iabbrev funciton function
iabbrev backgorund background
iabbrev backgournd background
iabbrev vlaue value
iabbrev cneter center
iabbrev cosnt const
iabbrev retrun return
iabbrev sapce space
iabbrev deisgn design
iabbrev reqeust request
iabbrev motoin motion
iabbrev iimport import
iabbrev Swiitch Switch
iabbrev mian main
iabbrev naem name
iabbrev imoprt import
iabbrev slecet select
iabbrev butotn button
iabbrev epxort export
