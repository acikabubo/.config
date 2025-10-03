# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="cobalt2"
# ZSH_THEME="arrow"
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions sudo suse tmux extract copypath copyfile copybuffer dirhistory zsh_reload)

source $ZSH/oh-my-zsh.sh

# User configuration
# PS1='%n@%m %1~ %# '

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
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Remove zsh-autosuggestions duplicates
setopt histignorealldups

setopt HIST_IGNORE_SPACE

# Ignore command to be added to history
HISTORY_IGNORE="dim|dca|git s|git b|git co *|git add *|git commit -m *|docker rm *|docker rmi *|ssh-keygen *|code *|chown*|chmod*|rm *|rm -r *|journalctl *|systemctl *|git clone *|workon *"

# No write wrong command in history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

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
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias zs="source ~/.zshrc"

# Set variables for virtualenvwrapper
export WORKON_HOME=~/development/venvs/
export PROJECT_HOME=~/development/projects/
export VIRTUALENVWRAPPER_PYTHON=`which python3`
# source /usr/local/bin/virtualenvwrapper.sh
source virtualenvwrapper.sh

# System default Python need to be found before the Anaconda version
export PATH="/usr/bin:$PATH"

# Set custom scripts
export PATH=$PATH:~/scripts

# GO paths
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/development/workspace/go"
export GOBIN="$HOME/development/workspace/go/bin"

# Set aliases
alias dim='docker images'
alias drmi='docker rmi'
alias dc='docker ps'
alias dca='docker ps -a'
alias drca='docker rm $(docker ps -a -q)'
alias dm='docker-machine'
alias dc='docker-compose'
alias deit='docker exec -it'
alias lz='lazydocker'
alias deac='deactivate'
alias dcr='docker-compose run --rm'

# Docker compose aliases
alias dcd='docker compose down'

# Set alias for starting portainer
alias startportainer='docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -l portainer.hide=true portainer/portainer-ce:latest | docker start portainer'
# Set alias for starting golang docker container
alias godocker='docker run --rm -it -v /home/acika/development/workspace/go:/go -p 8080:8080 --hostname go-host --name golang acikabubo/go'

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bg=cyan"

# Set alias for docker compose
alias dcup='docker compose up'
alias dcdown='docker compose down'

alias zh='code ~/.zsh_history'

# Set alias for rancher-machine (old docker-machine)
alias docker-machine='rancher-machine'

# Set alias for lazydocker
alias lzd='lazydocker'

# VPN's
alias up-ved='sudo wg-quick up ved'
alias down-ved='sudo wg-quick down ved'
alias up-sasa='sudo wg-quick up sasa'
alias down-sasa='sudo wg-quick down sasa'

# Git
export GIT_PAGER=cat

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
