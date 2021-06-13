
umask 077

export HISTSIZE=200000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

bindkey -e

export PS1='%n@%m %~ %# '

alias date-time-now='date "+%Y%m%d-%H%M%S"'

export EDITOR=vim
export VISUAL=vim

export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/opt/ghc-8.2.1/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/opt/pandoc/bin:$PATH
export PATH="$HOME/opt/pypy2-5.9.0/bin:$PATH"
export PATH="$HOME/opt/pypy-5.9-linux_x86_64-portable/bin:$PATH"
export PATH="$HOME/opt/node-v8.4.0-linux-x64/bin:$PATH"

export CARGO_INCREMENTAL=1

if [ -f $HOME/.cargo/env ]; then source $HOME/.cargo/env; fi

# Set _titleprefix and echo it.
titleprefix() {
    export _titleprefix="$* "
    echo_titleprefix
}

# Format titleprefix (including manually set _titleprefix) and echo it.
echo_titleprefix() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ "x$branch" != "x" ]; then branch="[$branch] "; fi
    print -Pn "\e]2;$_titleprefix$branch%n@%m: %~\a"
    if [ "x$TMUX" != "x" ]; then print -Pn "\ek$_titleprefix$branch%n@%m: %~\a"; fi
}

case $TERM in
    xterm*)
        precmd () {
            echo_titleprefix
        }
        ;;
    screen*)
        precmd () {
            echo_titleprefix
        }
        ;;
esac

export ZLE_SPACE_SUFFIX_CHARS=$'&|'

if which rg > /dev/null 2>&1
then
    export FZF_DEFAULT_COMMAND='rg -l .'
fi

if [ -f "$HOME/.zshrc.local" ]
then
    source "$HOME/.zshrc.local"
fi

if [[ -o interactive ]]
then
    renice -n 5 -p $$ >/dev/null 2>&1
fi

autoload -Uz compinit
compinit

