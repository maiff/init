# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Path to your oh-my-zsh installation.
  export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=("amuse" "avit" "bira" "bureau" "candy" "dogenpunk" "junkfood" "mortalscumbag" "rkj-repos" "smt" "sporty_256" "steeef" "suvash" "ys")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export FZF_BASE=/home/$USER/.linuxbrew/bin/fzf
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

plugins=(git git-open fzf zsh-syntax-highlighting tmux vi-mode extract rand-quote themes per-directory-history zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sshg='ssh qmxue@58.198.177.46'
alias ssh2='ssh qmxue@59.78.194.138'
alias ssh3='ssh qmxue@58.198.176.85'
alias sssh2='ssh server@59.78.194.138'
alias sshw='ssh qmxue@59.78.194.35'
alias em='emacs'
alias gpus='watch --color gpustat --color'
alias gpu0='CUDA_VISIBLE_DEVICES=0'
alias gpu1='CUDA_VISIBLE_DEVICES=1'
alias gpu2='CUDA_VISIBLE_DEVICES=2'
alias gpu3='CUDA_VISIBLE_DEVICES=3'
alias f='fuck'
alias sa='source activate'
alias rl='source ~/.zshrc'
alias net='curl --silent -d "action=login&username=51184501170&password=xqm8992249,,,&ac_id=1&user_ip=&nas_ip=&user_mac=&save_me=0&ajax=1" https://login.ecnu.edu.cn/include/auth_action.php'
alias tb='tensorboard --port 8288 --debugger_port 8287 --logdir .'
alias cl='clear'
alias vimn='nvim -u NONE'
alias vims='nvim -S .obsession.vim'
alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xdg="xdg-open"


# export ALL_PROXY=socks5://127.0.0.1:1080

# # vi style incremental search
# bindkey -v
#
# bindkey '^R' history-incremental-search-backward
# bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# ## zsh
# #alias vim="stty stop '' -ixoff ; vim"
# ## `frozing' tty, so after any command terminal settings will be restored
# #ttyctl -f
# KEYTIMEOUT=1
# zle -N zle-line-init
# #zle -N zle-keymap-select


eval $(thefuck --alias)

# autojump
[ -f /home/qmxue/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/qmxue/.linuxbrew/etc/profile.d/autojump.sh

# autosuggest
bindkey '^Y' autosuggest-execute
bindkey '^U' autosuggest-clear
bindkey '^T' autosuggest-accept

source ~/.zshrc.local

alias tl = tmux list-sessions
alias tkss = tmux kill-session -t
alias ta = tmux attach -t
alias ts = tmux new-session -s

alias gaa = git add --all
alias gcmsg = git commit -m
alias ga = git add
alias gst = git status
alias gp = git push
