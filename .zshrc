# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# LOAD COMPLETIONS
autoload -U compinit && compinit
zinit cdreplay -q

# ADD PATH
add_path() {
    # Mac specifies new user UIDs as starting at 500
    # Arch and Debian specify them as starting at 1000
    [ "$(id -u)" -ge 500 ] || return

    for i in "$@"; do
        # check if directory exists
        [ -d "$i" ] || continue

        # check that directory is not already in the path
        echo "$PATH" | grep -Eq "(^|:)$i(:|$)" && continue

        # all good, prepend
        export PATH="$i:${PATH}"
    done
}

add_path "$HOME"/.local/bin

# KEYBINDS
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^f' autosuggest-accept

# HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ENVIRONMENT VARIABLES
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"

export BROWSER="firefox"
export VISUAL=nvim
export EDITOR=nvim
export GIT_EDITOR=nvim
export DIFFPROG="nvim -d"

# STYLING
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:nvim*' fzf-preview 'bat --color=always --style=numbers $word'

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cat="bat -p"

# SHELL INTEGRATION
eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
