" SECTION: Install Plugin HERE
"====================================================================
" Pluggins{{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'easymotion/vim-easymotion' Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'https://github.com/chrisbra/NrrwRgn/' Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'liuchengxu/vista.vim' Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
" Treessiter
call plug#end()
"}}}1
" Linking{{{1
"====================================================================
" Linking to initial Pluggin
set runtimepath^=~/.vim runtimepath+=~/.vim/after
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIM,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set  runtimepath+=/usr/local/opt/fzf

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
