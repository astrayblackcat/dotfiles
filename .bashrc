#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
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
