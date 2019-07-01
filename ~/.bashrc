# start git bash here
cd ~

alias git='hub'       # https://github.com/github/hub

# Filesystem
alias rm='rm -r'
alias ls='ls -a'
alias ll='ls -l'
alias list='ls -aR'

alias fortune='~/.fortune'

function mk() {  # mkdir and cd into it
	mkdir -p $1
	cd $1
}

function copy() { # Copy output to clipboard (no echo)
	$@ | clip || return
}


function parse_git_branch() {  # Gets current git branch (if any)
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}] "
	else
		echo ""
	fi
}

#
#    Sam@Desktop ~ [master] $
#
#                        Red                    Blue                     Orange/Yellow             White
export PS1="\[\e[31m\]Sam@Desktop\[\e[0m\] \[\e[36m\]\w\[\e[0m\] \[\e[33m\]$(parse_git_branch)\[\e[0m\]\$ "