# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
# alias la='ls -A'
# alias l='ls -CF'

alias time='/usr/bin/time'
alias genpass='read -s pass; echo $pass | md5sum | base64 | cut -c -16; unset pass'
alias tmux='tmux -2'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function runTests() {
	RUNTESTS=0
	DIR="."
	if [[ -e dub.json ]]; then
		DIR="source/"
	fi
	echo "Watching ${DIR}"
	inotifywait -e close_write,moved_to,create -r -m ${DIR} |
	while :
	do
	    if read -t 1 ; then
		# echo "Have changes."
		RUNTESTS=1
	    else [ $? -lt 128 ] && exit
		# echo "Timeout"
		if [[ $RUNTESTS = 1 ]]; then
		    # echo "Run the tests."
		    clear ; make tests
		    RUNTESTS=0
		fi
	    fi
	done
}
