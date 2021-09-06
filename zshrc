### custom zshrc below ###

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pygmalion"
# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

[[ $UID = 0 ]] && ZSH_DISABLE_COMPFIX=true

plugins=(
   git
#   osx
   dotenv
)
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias gst="git status"
alias gca="git commit --amend"
alias glog="git log"
alias gdff="git diff"
alias git-sps="git stash && git pull && git stash pop"
alias ta="tig --all"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.pyenv/shims:/opt/homebrew/bin:$PATH"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
# if macos
# export ARCHFLAGS="-arch arm64"
# export OPENBLAS="$(brew --prefix openblas)"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
