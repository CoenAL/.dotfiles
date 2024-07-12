alias bal='nvim ~/.bash_aliases'
alias nv='nvim'
if command -v batcat &> /dev/null; then
	alias cat='batcat'
	alias bat='batcat'
fi

# config shortcuts
alias nvc='nvim ~/.config/nvim/'
alias i3c='nvim ~/.config/i3/config'
alias pbc='nvim ~/.config/polybar/config.ini'

# directory navigation
alias ..='cd ..'
alias -- -='cd -'

# fzf history
# NOTE: werkt nog niet, waarschijnlijk iets me awk of cut maar nu nog ff geen zin

# alias his='$(history | fzf)'

