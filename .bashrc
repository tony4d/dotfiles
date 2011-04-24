PATH=$HOME/bin:$PATH
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/bin
EDITOR=vi
export PATH EDITOR

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

# OS X only stuff
if uname -a | grep -q Darwin; then
    # Gotta have brew :)
    if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
    fi

    # Load Python virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh

    #Load Ruby rvm
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi