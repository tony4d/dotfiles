# Make sure things like ~/bin and /usr/local/bin are at the beginning
PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
EDITOR=vi

# Put together a nice looking prompt
function bash_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
export PS1="\[\033[0;35m\]\u\[\033[00m\]\
\[\033[0;33m\]@\$(hostname)\[\033[00m\]\
\[\033[0;32m\]:\[\033[00m\]\
\[\033[0;37m\]\w\[\033[00m\]\
\[\033[0;36m\]\$(bash_git_branch)\[\033[00m\]\
\[\033[0;32m\]\$\[\033[00m\] "

# Linux schtuff
if uname -a | grep -q Linux; then
    # aliases
    alias ls='ls --color=tty'
    eval `dircolors -b ~/.dircolors`
    PATH=$PATH:/usr/local/php/bin
    PATH=$PATH:/usr/local/mysql/bin
fi

# OS X schtuff
if uname -a | grep -q Darwin; then
    # OooOOo purty colors
    export CLICOLOR=1
    export LSCOLORS=xEGxcxdxbxegedabagacad

    # Gotta have brew :)
    if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
    fi

    # Gotta have pythonbrew
    [ -f "$HOME/.pythonbrew/etc/bashrc" ] && source "$HOME/.pythonbrew/etc/bashrc"
    # leave out virtualenv stuff for now
    #export WORKON_HOME=$HOME/.virtualenvs
    #source /usr/local/bin/virtualenvwrapper.sh

    #Load Ruby rvm
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi

export PATH EDITOR