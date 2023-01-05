#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# .zshrc file for Mac
#
# Author:  Vishnu Lagudu
# License: MIT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ALIASES
alias ls="ls -l -G -p"
# Write your own custom aliases here

# mcd
function mcd()
{
	mkdir $1
	cd $1
}

# Get the git branch
function g_b() 
{
    b=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')

    if [[ $b == "" ]]; then
        :
    else
		echo '('$b')'
    fi
}

# Up arrow to search history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# allow substitution inside the prompt
setopt prompt_subst
PROMPT='%B%F{2}%n@%m%f%b %B%F{3}%~%f%b %B%F{6}$(g_b)%f%b'$'\n''$ '