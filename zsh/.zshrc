# Initialize zplug
source /usr/share/zplug/init.zsh

# Load plugins with zplug
zplug "plugins/git", from:oh-my-zsh
zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "agkozak/zsh-z"
zplug "junegunn/fzf"

# Install plugins if not installed
if ! zplug check; then
    zplug install
fi

# Load plugins
zplug load

# Bind keys for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/carlos/code/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/carlos/code/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/carlos/code/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/carlos/code/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Source profile
source ~/.profile
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias grep='grep --color=auto'

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/themes/schiphol_omp_theme.json)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
