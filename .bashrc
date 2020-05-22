#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Aliases
alias e="emacsclient -c -n"
alias er="systemctl --user restart emacs"
alias ls='ls --color=auto'
alias .='cd /home'
alias g='git'
alias v='vim'
alias p='sudo pacman'
alias ccat='highlight --out-format=ansi'
alias dmenu='dmenu -h 24'

GO_PWR_MODS="git,hg,jobs,exit"
function _update_ps1() {
    PS1="[\w]$ $($GOPATH/bin/powerline-go -error $? -modules $GO_PWR_MODS -mode 'flat')"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

## Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.emacs.d/bin"
export PATH="$PATH:/home/.scripts"

stty -ixon # Disable ctrl-s/ctrl-q
shopt -s autocd # Auto-cd

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

## Start tmux as a background process
#tmux new-session -d -s michael

## Set default directory to home instead of .home
cd /home 
