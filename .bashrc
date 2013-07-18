PATH=/usr/local/bin:/usr/local/sbin:$PATH                # Locals in front
PATH=$HOME/.rbenv/shims:$HOME/bin:$PATH                  # Shims and homedir always first
PATH=$PATH:/sbin:/usr/sbin                               # I want sbin there too
PATH=$PATH:/usr/local/share/npm/bin                      # npm for hipstering
alias json='python -mjson.tool'
alias ju='sudo -ujposuser'
EDITOR=vi
set -o vi

# Put together a nice looking prompt
function bash_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
export PS1="\[\033[0;35m\]\u\[\033[00m\]\
\[\033[0;33m\]@\$(hostname)\[\033[00m\]\
\[\033[0;32m\]:\[\033[00m\]\
\[\033[0;37m\]\w\[\033[00m\]\
\[\033[0;36m\]\$(type bash_git_branch &>/dev/null && bash_git_branch)\[\033[00m\]\
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
    export LSCOLORS=HEGxcxdxbxegedabagacad

    # bash completion
    [ -f `brew --prefix`/etc/bash_completion ] && . `brew --prefix`/etc/bash_completion
    # python
	[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
	[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
    # ruby
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    # Local node
    PATH=$PATH:$HOME/local/node/bin
    NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules
fi

export PATH NODE_PATH EDITOR