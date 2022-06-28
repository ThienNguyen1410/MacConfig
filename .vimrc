" cnext/ cpre
nnoremap <del>s :cpre<cr>
nnoremap <del>d :cnext<cr>
set modifiable
set nocompatible


" scratch
let g:scratch_insert_autohide=0
" zoom
nmap zz <c-w>m

" bookmark
let g:bookmark_manage_per_buffer = 1

let g:python3_host_prog = '/usr/local/bin/python/'

" Cursor Line
let g:conoline_color_normal_light = 'guibg=#eaeaea'
let g:conoline_color_normal_nr_light = 'guibg=#eaeaea'
let g:conoline_color_insert_light = 'guibg=#ffffff'
let g:conoline_color_insert_nr_light = 'guibg=#ffffff'

nnoremap <del>i 3<c-y>
nnoremap <del>k 3<c-e>

inoremap <del>i <c-o> 3<c-y>
inoremap <del>k <c-o> 3<c-e>

nnoremap <silent> <del>w :tabn 1<cr>
nnoremap <silent> <del>e :tabn 2<cr>
nnoremap <silent> <del>r :tabn 3<cr>
nnoremap <silent> <del>t :tabn 4<cr>
nnoremap <space><space> %
" ???
nnoremap <buffer> <silent> <Leader>tn
nnoremap <A-5> :call Initial()<cr>
" nnoremap <A-6> :Buffers<cr>
" nnoremap <A-7> :call English()<cr>
nnoremap <A-8> n
inoremap <A-8> <C-o>n
vnoremap <A-8> n
nnoremap <A-9> N
inoremap <A-9> <C-o>N
vnoremap <A-9> N
nmap <Del>1 :Clap yanks<cr>

inoremap <f1> <c-o>:exe "normal \<c-y>,"<cr>
inoremap <f2> <c-o>:exe "normal gS"<cr>
inoremap <f3> <c-o>:exe "normal gJ"<cr>
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

nnoremap ' `

nnoremap i <UP>
nnoremap j <LEFT>
nnoremap l <RIGHT>
nnoremap k <DOWN>

vnoremap j <ESC>
vnoremap l <ESC>
vnoremap k <ESC>

inoremap jj <ESC>
imap ,, <c-y>j

nnoremap ` <ESC>
tnoremap ` <ESC>
vnoremap ` <ESC>
onoremap ` <ESC>
cnoremap ` <ESC>
tnoremap <leader><Esc> <C-\><C-n>
let mapleader="\\"
let maplocalleader=";"

nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Advanced Move
" Left
nnoremap <C-LEFT> b
inoremap <C-LEFT> <C-o>b
vnoremap <C-LEFT> b
" Right
nnoremap <C-RIGHT> e
inoremap <C-RIGHT> <C-o>e<RIGHT>
vnoremap <C-RIGHT> e
" End line
nnoremap <C-e> $
inoremap <C-e> <C-o>$
vnoremap <C-e> $
" Start line
nnoremap <C-a> 0
inoremap <C-a> <C-o>0
vnoremap <C-a> 0
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

hi NonText ctermfg=7 guifg=gray
highlight LineNr term=bold cterm=NONE ctermfg=LightYellow ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi CursorLineNr term=italic cterm=bold ctermfg=2 guifg=Grey guibg=None


if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Fill Quote for JSON
let @p='wyst:"f:wys$"A,jj'

let s:hidden_all = 0

" Go to last active tab
" Disable status bar
if !has("gui_running")
  au VimEnter * call HiddenAll()
  au BufEnter * call HiddenAll()
endif
au TabLeave * let g:lasttab = tabpagenr()
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> <leader>1 /class<cr>

function! Abbre()
  :execute "normal! v3iwy"
  :execute "e ~/.config/nvim/init.vim"
  :execute "normal! Go\<esc>pIiabbrev\<space>\<esc>"
  :execute "w"
  :execute "bpre"
  :execute "bdelete init.vim"
endfunction
function VspFunction()
  " Step 1
  redir @*
  execute ":echo expand('#" . bufnr("%") . "#:p')"
  redir END
  " Step 2
  execute 'normal Gojj"*pGyyuu'
  :WintabsClose
  " Step 3
  execute "vsp ".@*.""
endfunction
function SpFunction()
  " Step 1
  redir @*
  execute ":echo expand('#" . bufnr("%") . "#:p')"
  redir END
  " Step 2
  execute 'normal Gojj"*pGyyuu;x'
  :WintabsClose
  " Step 3
  execute "sp ".@*.""
endfunction
function TabFunction()
  " Step 1
  redir @*
  execute ":echo expand('#" . bufnr("%") . "#:p')"
  redir END
  " Step 2
  execute 'normal Gojj"*pGyyuu;x'
  :WintabsClose
  " Step 3
  execute "tabe ".@*.""
endfunction
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')

  let height = float2nr(&lines/2)
  let width = float2nr(&columns - (&columns * 2 / 10))
  "let width = &columns
  let row = float2nr(&lines / 3)
  let col = float2nr((&columns - width) / 3)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height':height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
endfunction
  set shortmess+=A
  set hidden
  set nobackup
  set nowritebackup
  set cmdheight=2
  set updatetime=300
  set shortmess+=c
  set signcolumn=yes
  "Fold
  set foldmethod=syntax
  set foldenable
  set foldlevel=0
  set foldlevelstart=0
  " specifies for which commands a fold will be opened
  set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
  set nowrap
  set nu
  set foldcolumn=2
  " set viewoptions=cursor,slash,unix
function DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction
function! HiddenAll()
  let s:hidden_all = 1
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
  set statusline=-
  let &statusline='--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
  set fillchars=stl:-
  hi statusline none
  hi statuslinenc none
  hi ClapDisplay ctermbg=none
endfunction
  
function! SetScheme()
  colorscheme OceanicNext
  " colorscheme monokai
  " colorscheme badwolf
  set background=dark
  " let g:colors_name="OceanicNext"
  " let g:colors_name="badwolf"
  " let g:airline_theme='oceanicnext'
endfunction
function SetTabline()
  hi Tabline ctermfg=Grey ctermbg=None cterm=italic
  hi TabLineFill ctermfg=None ctermbg=None cterm=None
  hi TabLineSel ctermfg=Red ctermbg=None cterm=Bold

  let g:wintabs_powerline_arrow_left = "\u25c0"
  let g:wintabs_powerline_arrow_right = "\u25b6"
  let g:wintabs_powerline_sep_buffer_transition = "\ue0b0"
  let g:wintabs_powerline_sep_buffer = "\ue0b1"
  let g:wintabs_powerline_sep_tab_transition = "\ue0b2"
  let g:wintabs_powerline_sep_tab = "\ue0b3"

  highlight link WintabsEmpty TabLineFill
  highlight link WintabsActive TabLineSel
  highlight link WintabsInactive TabLine
  highlight link WintabsArrow TabLine
  highlight link WintabsActiveNC TabLine
  highlight link WintabsInactiveNC TabLine
  highlight link WintabsInactiveNC TabLine
  highlight link WintabsInactiveNC TabLine

endfunction
function! SetInterface()
  set nocompatible
  filetype plugin on
  " set foldmethod=marker
  set hidden
   syntax on
     highlight Comment cterm=italic
  " Display Special Char
  set encoding=utf-8
  set list listchars=tab:⇨\ ,trail:-,eol:⏎

  "Tab & Space
  set tabstop=4       " number of visual spaces per TAB
  set softtabstop=4   " number of spaces in tab when editing
  set shiftwidth=4    " number of spaces to use for autoindent
  set expandtab       " tabs are space
  set autoindent
  set copyindent      " copy indent from the previous line
  call SetScheme()
  call SetTabline()
     "Signify{
  set updatetime=100

  highlight SignifySignAdd    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE
  highlight SignifySignDelete    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE
  highlight SignifySignChange    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE
  highlight SignifySignDeleteFirstLine    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE

  highlight SignifySignLineDelete    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE
  highlight SignifySignLineDeleteFirstLine    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE
  highlight SignifySignLineChange    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE
  highlight SignifySignLineAdd    ctermfg=None  guifg=#282c34 cterm=NONE gui=NONE

  highlight SignColumn ctermbg=none cterm=NONE guibg=#282c34 gui=NONE

  let g:signify_sign_add="✙"
  let g:signify_sign_delete="✘"
  let g:signify_sign_change = "✎"

  let g:indentLine_enabled=1
  set conceallevel=2
  let g:vim_markdown_frontmatter = 1
  highlight Folded ctermbg=none cterm=italic
  :hi VimwikiHeader1 ctermfg=green
  :hi VimwikiHeader2 ctermfg=blue
  :hi VimwikiHeader3 ctermfg=9
  hi Search term=inverse,bold cterm=bold ctermbg=none ctermfg=white gui=bold guibg=none guifg=white
  hi Search term=inverse,bold cterm=bold ctermbg=none ctermfg=white gui=bold guibg=none guifg=white
  hi Type cterm=italic ctermbg=none ctermfg=green gui=italic,bold guibg=gray guifg=white
  hi Visual cterm=italic ctermbg=darkgray ctermfg=lightyellow gui=italic,bold guibg=gray guifg=white

  " highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
  highlight link multiple_cursors_cursor Visual
  hi multiple_cursors_visual term=inverse,bold cterm=bold ctermbg=darkgray ctermfg=white gui=bold guibg=none guifg=white
  hi MatchParen ctermfg=DarkMagenta guifg=blue ctermbg=none guibg=none cterm=italic,bold gui=italic,bold
  hi MatchWord ctermfg=DarkMagenta guifg=blue cterm=italic,bold gui=italic,bold
  highlight default link WhichKey          Operator
  highlight WhichKeySeperator term=bold cterm=NONE ctermfg=Green ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
  highlight default link WhichKeyGroup     Identifier
  highlight default link WhichKeyDesc      Function
  hi EasyMotionShade  ctermbg=none ctermfg=lightblue
endfunction
call SetInterface()
" --------
"}}}
"}}}
" FINDER{{{1
""" nerdtree{{{2
let g:NERDTreeMapOpenSplit=""
let g:NERDTreeMenuUp = "i"
let g:NERDTreeMenuDown="k"
let g:NERDTreeWinSize=30
let g:NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapOpenSplit=""
let g:NERDTreeMenuUp = "i"
let g:NERDTreeMenuDown="k"

"}}}
""" fzf{{{2
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction
  " Use vim-devicons
    let g:fzf_preview_use_dev_icons = 1

    " devicons character width
    let g:fzf_preview_dev_icon_prefix_length = 2
    let g:fzf_action = {
          \ 'ctrl-q': function('s:build_quickfix_list'),
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }
    let g:fzf_buffers_jump = 1
    nnoremap <Del>8 :call fzf#vim#files(".")<cr>
    " nmap <leader><tab> <plug>(fzf-maps-n)
    " xmap <leader><tab> <plug>(fzf-maps-x)
    " omap <leader><tab> <plug>(fzf-maps-o)

    if executable('rg')
      let $FZF_DEFAULT_COMMAND="rg --files --iglob '!*.m4a' --iglob '!*.mp3' --iglob '!*.flac' --iglob '!*.pdf' --iglob '!*.jgp' --iglob '!*.JPG' --iglob '!*.png' --iglob '!*.zip' --iglob '!*.jpeg' --iglob '!*.m4a' --iglob '!~/Library/*' --iglob '!{node_modules/*,.git/*}'"
      set grepprg=rg\ --vimgrep
      command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    endif

    command! -bang -nargs=? -complete=dir Buffs
          \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview(), <bang>0)
    command! -bang -nargs=? -complete=dir Files
          \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case --iglob "!{node_modules/*,.git/*}" '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview(), <bang>0)
    let g:tern#command = ['tern']
    autocmd! FileType fzf set laststatus=0 noshowmode noruler
          \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    let $FZF_DEFAULT_OPTS='--layout=reverse --bind ctrl-a:select-all'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    let g:fzf_preview_quit_map = 1
    let g:fzf_preview_use_floating_window = 1
    let g:fzf_preview_floating_window_rate = 0.9
    let g:fzf_preview_floating_window_winblend = 15
    let g:fzf_preview_command = 'head -100 {-1}'
    let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'
    let g:fzf_binary_preview_command = 'echo "{} is a binary file"'
    let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
    let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'
    let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
    let g:fzf_preview_git_status_command = "git status --short --untracked-files=all | awk '{if (substr($0,2,1) !~ / /) print $2}'"
    let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'
    let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'
    let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'
    let g:fzf_preview_fzf_color_option = ''
    let g:fzf_preview_custom_default_processors = {}
    let g:fzf_preview_fzf_preview_window_option = 'up:30%'
    let g:fzf_preview_filelist_postprocess_command = ''
    let g:fzf_preview_layout = 'top split new'
    let g:fzf_preview_rate = 0.3
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

    "}}}
" Deoplete
let g:deoplete#enable_at_startup = 1
""" coc.nvim{{{2
autocmd BufWritePre *.js Prettier
autocmd BufWritePre *.jsx Prettier
autocmd BufWritePre *.ts Prettier
autocmd BufWritePre *.tsx Prettier
autocmd BufWritePre *.sol Prettier
autocmd BufWritePre *.dat %!xxd
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
autocmd CursorHold * silent call CocActionAsync('highlight')
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:coc_snippet_next = '<Del>4'
let g:coc_snippet_prev = '<Del>5'
nmap <Leader>ca <Plug>(coc-calc-result-append)
nmap <Leader>cr <Plug>(coc-calc-result-replace)
nmap <Del>9 :silent execute "CocCommand explorer --quit-on-open"<cr>
augroup COC
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

""" Tagbar
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/bin/ctags'


""" ctrlsf{{{2
nnoremap <del>x :CtrlSF 
let g:ctrlsf_mapping = {
\       "open"    : ["<CR>", "o"],
\       "openb"   : "O",
\       "split"   : "<C-O>",
\       "vsplit"  : "",
\       "tab"     : "t",
\       "tabb"    : "T",
\       "popen"   : "e",
\       "popenf"  : "E",
\       "quit"    : "q",
\       "next"    : "<C-J>",
\       "prev"    : "<C-K>",
\       "pquit"   : "q",
\       "loclist" : "",
\       "chgmode" : "M",
\       "stop"    : "<C-C>",
\  }
"}}}
""" far{{{2
nnoremap R :Far 
"}}}
"}}}
" LAYOUT{{{1
""" animate (resize window){{{2
nnoremap <silent> <A-Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <A-Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <A-Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <A-Right> :call animate#window_delta_width(-10)<CR>
""" wintabs{{{2

nnoremap Q :WintabsClose<cr>
nnoremap <C-N> :WintabsNext<CR>
nnoremap <C-P> :WintabsPrevious<CR>
let g:wintabs_ui_vimtab_name_format="%n %t"

      "}}}
""" startify{{{2
let g:startify_lists = [
    \ { 'header': ['MRU'],            'type': 'files' },
    \ { 'header': ['Coding'],       'type': 'commands' },
    \ ]
" \ { 'header': ['MRU'],            'type': 'files' },
let g:startify_change_to_dir = 1
" Stack
let g:stack#config#min_colums=70

""" clever-f{{{2
let g:clever_f_across_no_line=1
" }}}
""" autopair{{{2
  let g:AutoPairsMapCR = 1
  let g:AutoPairsShortcutToggle = '<leader>u'
  let g:AutoPairsShortcutJump = '<C-Y>e'
"}}}
""" easymotion{{{2
nmap s <Plug>(easymotion-overwin-line)
vmap S <Plug>(easymotion-s2)
nmap <del>h <Plug>(easymotion-j)
nmap <del>o <Plug>(easymotion-k)
vmap <del>h <Plug>(easymotion-j)
vmap <del>o <Plug>(easymotion-k)

" Move to word
" nmap <del>q <Plug>(easymotion-bd-w)
" imap <del>q <c-o><Plug>(easymotion-bd-w)
" Easymotion
let g:EasyMotion_keys = "asdfghjkl;'qweuiorzxcnm,.12390"
let g:EasyMotion_smartcase = 1

"}}}
""" expand-region{{{2
map + <Plug>(expand_region_expand)
map = <Plug>(expand_region_shrink)
"}}}
""" cutclass && yoink{{{2
  nnoremap h d
  xnoremap h d
  nnoremap hh dd
  let g:yoinkIncludeDeleteOperations=1
  set wildignore+=*/node_modules/*
  " nnoremap <c-o> <plug>(yoinkpostpasteswapforward)
  " nnoremap <c-i> <plug>(yoinkpostpasteswapback)
  nmap p <plug>(YoinkPaste_p)
  nmap p <plug>(YoinkPaste_p)
  nmap ]y <plug>(YoinkRotateForward)
  nmap [f <plug>(YoinkPostPasteToggleFormat)
  nmap y "*<plug>(YoinkYankPreserveCursorPosition)
  xmap y "*<plug>(YoinkYankPreserveCursorPosition)
""" matchup{{{2
  xmap a<space><Del>q <plug>(matchup-a%)
  xmap i<space><Del>q <plug>(matchup-i%)
  xmap <space><Del>q <plug>(matchup-%)
  nmap <space><Del>q <plug>(matchup-%)
  " xmap <del>6 <plug>(matchup-z%)
  " nmap <del>6 <plug>(matchup-z%)
  " imap <del>6 <c-o><plug>(matchup-z%)

  "}}}
""" move{{{2
  let g:move_map_keys = 0
  nmap <A-i> <Plug>MoveLineUp
  nmap <A-k> <Plug>MoveLineDown
  nmap <A-j> <Plug>MoveLineLeft
  nmap <A-l> <Plug>MoveLineRight
  vmap <A-i> <Plug>MoveBlockUp
  vmap <A-k> <Plug>MoveBlockDown
"}}}
""" scratch{{{2
let g:scratch_no_mappings = 1
" let g:scratch_autohide = 0
nmap gs <plug>(scratch-insert-reuse)
xmap gs <plug>(scratch-selection-reuse)
augroup ScratchGroup
    autocmd FileType scratch nnoremap <buffer> q :q<cr>
augroup END
"}}}
"}}}
" HELPER{{{1
""" which-key{{{2
nnoremap <silent> <localleader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
" Single mappings
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['y'] = [ ':CocList -A --tab --strict yank'                       , 'Yank' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                       , 'Undotree' ]
let g:which_key_map['c'] = [ ':ccl | lcl'                       , 'Close quickfix' ]
" let g:which_key_map['x'] = [ ':WintabsClose'                       , 'Close buf' ]
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

let g:which_key_map.t = {
      \ 'name' : '+todo',
      \ 'd' : [':normal \td', 'Mark done'],
      \ 'D' : [':normal \tD', 'Archive done'],
      \ 'x' : [':normal \tx', 'Mark cancel'],
      \ 't' : [':normal \tt', 'Mark today'],
      \ 'X' : [':normal \tX', 'Show cancelled'],
      \ 'T' : [':normal \tT', 'Show today'],
      \ '/' : [':normal \t/', 'Search keyword'],
      \ 's' : [':normal \ts', 'Search tag'],
      \ 'f' : [':normal \t.', 'Fold all notes'],
      \ 'n' : [':normal \tk', 'Previous project'],
      \ 'p' : [':normal \tj', 'Next project'],
      \ 'g' : [':normal \tg', 'Go to'],
      \ 'o' : [':tabe ~/todo.taskpaper', 'Open todo']
      \ }
let g:which_key_map.f = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }
" Register which key map
call which_key#register('<space>', "g:which_key_map")
nnoremap <space>1 :call VspFunction()<cr>
nnoremap <space>2 :call SpFunction()<cr>
nnoremap <space>3 :call TabFunction()<cr>
nnoremap <silent> <space>r :TabooRename
nnoremap <silent> <space>q  <esc>
nnoremap <space>d <C-I>
nnoremap <space>s <C-o>
nnoremap <space><tab> :CtrlSFToggle<cr>
nnoremap <space>D :SignifyDiff<cr>
nmap <space>n \nn
vnoremap <space>w :NRP<cr>


noremap <space>a zO
nnoremap <space>x zX

" VERSION CONTROL{{{1
""" signify{{{2
nnoremap w :SignifyHunkDiff<cr>
nnoremap W :SignifyHunkUndo<cr>
nmap e <plug>(signify-next-hunk)
nmap E <plug>(signify-prev-hunk)
" }}}
""" undoTree{{{2
  let g:undotree_WindowLayout=2
  let g:undotree_SetFocusWhenToggle=1

"}}}
" }}}
" COMMAND{{{1
""" over{{{2
nnoremap <del>u :OverCommandLine<cr>
vnoremap <del>u :OverCommandLine<cr>
" }}}
" }}}
" WORKSPACE{{{1
""" signature (marks){{{2
  let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "mm",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "md",
        \ 'PurgeMarks'         :  "m<bs>",
        \ 'PurgeMarkers'       :  "m<leader>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "<del>g",
        \ 'GotoPrevLineByPos'  :  "<del>f",
        \ 'GotoNextSpotByPos'  :  "]`",
        \ 'GotoPrevSpotByPos'  :  "[`",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListBufferMarks'    :  "m/",
        \ 'ListBufferMarkers'  :  "m?"
        \ }

  "}}}
""" bookmark{{{2
    let g:bookmark_no_default_key_mappings=1
highlight BookmarkSign ctermbg=NONE ctermfg=199
highlight BookmarkLine ctermbg=184 ctermfg=162
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
  nmap bb <Plug>BookmarkShowAll
  nmap bi <Plug>BookmarkAnnotate
  nmap bc <Plug>BookmarkClearAll
  nmap bx <Plug>BookmarkClear
  nmap bt <Plug>BookmarkToggle
  nmap bl <Plug>BookmarkMoveToLine
  nmap zuz <Plug>(FastFoldUpdate)

  "}}}
""" fold{{{2
  function! s:ToggleFoldcolumn(fold)
    if &foldcolumn
      let w:foldcolumn = &foldcolumn
      silent setlocal foldcolumn=0
      if a:fold | silent setlocal nofoldenable | endif
    else
      if exists('w:foldcolumn') && (w:foldcolumn!=0)
        silent let &l:foldcolumn=w:foldcolumn
      else
        silent setlocal foldcolumn=4
      endif
      if a:fold | silent setlocal foldenable | endif
    endif
    setlocal foldcolumn?
  endfunction
  let g:fastfold_savehook = 1
  let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
  let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
  let g:markdown_folding = 1
  let g:tex_fold_enabled = 1
  let g:vimsyn_folding = 'af'
  let g:xml_syntax_folding = 1
  let g:javaScript_fold = 1
  let g:sh_fold_enabled= 7
  let g:ruby_fold = 1
  let g:perl_fold = 1
  let g:perl_fold_blocks = 1
  let g:r_syntax_folding = 1
  let g:rust_fold = 1
  let g:php_folding = 1

  nnoremap <silent> L zr:<c-u>setlocal foldlevel?<CR>
  nnoremap <silent> J zm:<c-u>setlocal foldlevel?<CR>

  " nnoremap <silent> zR zR:<c-u>setlocal foldlevel?<CR>
  " nnoremap <silent> zM zM:<c-u>setlocal foldlevel?<CR>

  nnoremap zi  :<c-u>call <SID>ToggleFoldcolumn(1)<CR>
  nnoremap coz :<c-u>call <SID>ToggleFoldcolumn(0)<CR>
  nmap     cof coz

" version control
"}}}
""" vim-stay{{{
  set viewoptions=cursor,folds,slash,unix
"}}}
"}}}
" TAG{{{1
""" vista{{{2
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
  nmap P :Vista coc<CR>
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista_default_executive = 'ctags'
  let g:vista_executive_for = {
        \ 'cpp': 'vim_lsp',
        \ 'php': 'vim_lsp',
        \ }
  let g:vista_ctags_cmd = {
        \ 'haskell': 'hasktags -x -o - -c',
        \ }
  let g:vista_fzf_preview = ['right:50%']
  let g:vista#renderer#enable_icon = 1
  let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }

  "}}}
""" gutentags{{{2
  let g:gutentags_ctags_exclude = [".git","node_modules","public"]

"}}}
"}}}
" OTHERS{{{1
""" unimpaired{{{2
"}}}
""" incsearch{{{2
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {
        \     "\<C-l>": '<Over>(easymotion)'
        \   },
        \   'is_expr': 0
        \ }), get(a:, 1, {}))
endfunction
  noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
  noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
  noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

  "}}}
""" codi{{{2
  let g:codi#width=100
  let g:codi#rightalign=0
  highlight CodiVirtualText ctermfg=darkgreen
  let g:codi#virtual_text_prefix = "   ❯❯ "
  let g:codi#aliases = {
        \ 'javascript.jsx': 'javascript',
        \ }

  "}}}
" Coc Highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

""" hardtime{{{2
  " let g:hardtime_default_on = 1
  let g:list_of_normal_keys = ["h", "i", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>","<C-UP>","<C-DOWN>","<C-LEFT>","<C-RIGHT>"]
  let g:list_of_visual_keys = ["h", "i", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>","<C-UP>","<C-DOWN>","<C-LEFT>","<C-RIGHT>"]
  let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
  let g:list_of_disabled_keys = []

  "}}}
""" claps{{{2
let g:clap_layout = { 'width': '95%', 'col': '5%' }
"}}}
""" dash{{{2
nmap <silent> \d <Plug>DashSearch
"}}}
""" intentline{{{2
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"}}}


" END{{{1
augroup Vim
    autocmd Filetype vim let b:coc_suggest_disable = 1
    autocmd Filetype vim let b:AutoPairs = {}
    autocmd Filetype vim set foldmethod=marker
augroup end

augroup ClapGroup
autocmd!
hi ClapDisplay ctermbg=none
autocmd User ClapOnEnter
    " autocmd User ClapOnExit    call YourFunction()
augroup END

augroup QuickFix
    autocmd FileType qf set rnu
    autocmd FileType qf nnoremap <cr> <cr>
    autocmd FileType qf nnoremap <buffer> q :q<cr>
augroup end
"}}}
let g:instant_username = "THIEN"

