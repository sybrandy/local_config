# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export EDITOR=vim
PATH=$PATH:~/apps/bin

export AWT_TOOLKIT=MToolkit

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return
if [ -n "$PS1" ]; then

    export JAVA_HOME=/usr/lib/jvm/default-java
    PATH=$PATH:$JAVA_HOME/bin:$M2
    ETL_HOME=/home/blockcipher/dev/etl
    export CLASSPATH=~/.m2/repository/

    # Create symlinks to local-installed executables in the apps/bin directory.
    # ls <dir> | xargs -I {} ln -s <dir>/{} {}

    # If dmd is installed, add to the path.
    if [ -e ~/apps/dmd2/linux/bin64 ]; then
        PATH=$PATH:~/apps/dmd2/linux/bin64
    fi

    # Configuration for Tomcat, if installed.
    if [ -e ~/apps/tomcat ]; then
        export CATALINA_HOME=~/apps/tomcat
    fi

    TEMP=/tmp/

    # don't put duplicate lines in the history. See bash(1) for more options
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoredups:ignorespace

    # append to the history file, don't overwrite it
    # Also, added some additional code to print out the return code of a
    # program if it wasn't 0.
    shopt -s histappend
    PROMPT_COMMAND='ret=$?; history -a; if [ $ret -ne 0 ] ; then echo -e "returned \033[01;31m$ret\033[00;00m"; fi'

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000
    HISTFILESIZE=2000

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    [[ -e ~/perl5/ ]] && source ~/perl5/perlbrew/etc/bashrc

    # Set up VI mode for bash
    set -o vi
    bind -m vi-command ".":insert-last-argument
    bind -m vi-insert "\C-l.":clear-screen
    bind -m vi-insert "\C-a.":beginning-of-line
    bind -m vi-insert "\C-e.":end-of-line
    bind -m vi-insert "\C-w.":backward-kill-word

    # Alias for starting elasticsearch.
    alias startes='/opt/orion/search/es/bin/elasticsearch -f'

    # Enable syntax highlighting in less if source-highlight is installed.
    if [ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]; then
        export LESS="-R"
        export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    fi
fi

# RVM Config
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -e ~/.rvm ]] && rvm use 1.9.2@Cyber
# [[ -s "/opt/rvm/scripts/rvm" ]] && source "/opt/rvm/scripts/rvm"
# [[ -e "/opt/rvm/scripts/rvm" ]] && PATH=$PATH:/opt/rvm/bin # Add RVM to PATH for scripting

# Perlbrew Config
[[ -e ~/perl5/ ]] && perlbrew use perl-5.8.9

[[ -e /opt/mongodb/bin/ ]] && PATH=$PATH:/opt/mongodb/bin # Add MongoDB to PATH for scripting

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

weather(){ curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-21104}"|perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';}
