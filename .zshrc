#ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# LOAD COMPLETIONS
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
zinit cdreplay -q

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

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
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export BROWSER="firefox"
export VISUAL=nvim
export EDITOR=nvim
export GIT_EDITOR=nvim
export DIFFPROG="nvim -d"

# STYLING
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd*' fzf-flags --style=full --height=-5
zstyle ':fzf-tab:complete:cd*' fzf-preview 'eza --color=always --icons --oneline $realpath'
zstyle ':fzf-tab:complete:nvim*' fzf-flags --style=full --height=-5
zstyle ':fzf-tab:complete:nvim*' fzf-preview 'bat --color=always --style=numbers $realpath'

# ALIASES
alias ls='eza --icons'
alias grep='grep --color=auto'
alias cat="bat -p"
alias vs="kitten @ launch --location=vsplit --cwd=current"
alias sp="kitten @ launch --location=hsplit --cwd=current"
alias msx="mise x --"
alias msr="mise r"

eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
