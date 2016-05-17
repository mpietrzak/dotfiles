
umask 077

export HISTSIZE=200000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

bindkey -e

export PS1='%n@%m %~ %# '

alias irc="mosh mp@chaos.hell.cx -- screen -drU irc"
alias date-time-now='date "+%Y%m%d-%H%M%S"'
alias verynice='taskpolicy -c maintenance -- '

export EDITOR=vim
export VISUAL=vim

export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/opt/ghc-8.0.1/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/opt/gradle-2.13/bin:$PATH
export PATH=$HOME/opt/jdk1.8.0_92/bin:$PATH
export PATH=$HOME/opt/pypy-5.1.1-linux64/bin:$PATH
export PATH=$HOME/bin:$PATH

titleprefix() {
    export _titleprefix="$*"
    print -Pn "\e]2;$_titleprefix %n@%m: %~\a"
}

case $TERM in
    xterm*)
        precmd () {
            local p="\e]2;$_titleprefix %n@%m: %~"
            local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
            if [ "$branch" != "" ]; then
                p="$p [$branch]"
            fi
            p="$p\a"
            print -Pn "$p"
        }
        ;;
esac

autoload -Uz compinit
compinit

export ZLE_SPACE_SUFFIX_CHARS=$'&|'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

