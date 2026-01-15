# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize zplug
source /usr/share/zplug/init.zsh

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # Append to history file, don't overwrite
setopt SHARE_HISTORY           # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is duplicate
setopt HIST_FIND_NO_DUPS       # Don't display duplicates during search
setopt HIST_IGNORE_SPACE       # Don't record entries starting with space
setopt HIST_SAVE_NO_DUPS       # Don't write duplicates to history file
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording
setopt INC_APPEND_HISTORY      # Write to history file immediately, not when shell exits

# Load plugins with zplug
zplug "plugins/git", from:oh-my-zsh
zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-completions"
zplug "marlonrichert/zsh-autocomplete"
zplug "Aloxaf/fzf-tab"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "agkozak/zsh-z"
zplug "junegunn/fzf"
zplug "lukechilds/zsh-nvm"
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins if not installed
if ! zplug check; then
    zplug install
fi

# Load plugins
zplug load

# Load Powerlevel10k configuration
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

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
