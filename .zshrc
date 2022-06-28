# If ycu come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/Users/Thien/.oh-my-zsh"
export LANG=en_US.UTF-8
# export LANG="de_AT.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"
#export JAVA_HOME=$(/usr/libexec/java_home -v16)
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
# export TERM="screen-256color"
# export DISPLAY="/private/tmp/com.apple.launchd.GEt1nPKgPM/org.macosforge.xquartz:0"
# export DISPLAY=:0.0


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="robbyrussell"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/oceanic-next-shell/oceanic-next.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Aliases
# No spacing between =

alias backup="\\cp ~/.vimrc ~/backup/.vimrc && \\cp ~/.config/nvim/init.vim ~/backup/init.vim"
alias tmux='tmux -2'
alias glog='git log --all --oneline --graph'
alias note='vim ~/work_space/note/note.md'
alias gvim='cd ~/.local/share/nvim/plugged'
alias gkara='cd ~/.config/karabiner/assets/complex_modifications'
alias ineo='nvim ~/.config/nvim/init.vim'
alias ivim="nvim -c 'BLines \"\"\"' ~/.vimrc"
# alias mm="nvim -c 'BLines \"\"\"' ~/.config/nvim/management"
alias render='img2sixel "$(ls -t * | head -1)"'
alias leet='open "https://leetcode.com/problemset/all/?difficulty=Easy"'
alias yt='open "https://www.youtube.com"'
alias inspector='cd /Users/Thien/Il2CppInspector/Il2CppInspector.CLI/bin/Release/netcoreapp3.1/osx-x64/publish'
alias inspectDir='/Users/Thien/Il2CppInspector/Il2CppInspector.CLI/bin/Release/netcoreapp3.1/osx-x64/publish'
# alias tmux="TERM=screen-256color-bce tmux"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-completions zsh-autosuggestions)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
source ~/.profile

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH=/usr/local/opt/python3/libexec/bin:$PATH





# Codi
# codi() {
#   local syntax="${1:-python}"
#   shift
#   vim -c \
#     "let g:startify_disable_at_vimenter = 1 |\
#     set bt=nofile ls=0 noru nonu nornu |\
#     hi ColorColumn ctermbg=NONE |\
#     hi VertSplit ctermbg=NONE |\
#     hi NonText ctermfg=0 |\
#     Codi $syntax" "$@"
# }

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
export NEO="~/.config/nvim/init.vim"
# codi() {
#    local syntax="${1:-python}"
#    shift
#    nvim -c \
#      "let g:startify_disable_at_vimenter = 1 |\
#      set bt=nofile ls=0 noru nonu nornu |\
#      hi CodiVirtualText guifg=red
#      hi ColorColumn ctermbg=NONE |\
#      hi VertSplit ctermbg=NONE |\
#      hi NonText ctermfg=0 |\
#      Codi $syntax" "$@"
# }
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
export PATH="/usr/local/opt/ruby/bin:$PATH"
