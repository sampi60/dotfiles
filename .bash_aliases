alias ls='ls -la --color=auto'

# Git
alias gs='git status'
alias gb='git branch'
alias gl='git log -5 --pretty=format:"%C(auto)%h - %C(reset)%an, %C(green)%ar: %C(bold cyan)%s"'
alias gp='git push'
alias gpo='gp origin master'
alias gph='gp heroku master'
alias gc='git commit -m'
alias gca='git commit --amend'
alias grevert='git reset --soft HEAD~1'

# gem pry
alias pryr='pry -r ./config/environment'

# rvm
alias rgl='rvm gemset list'
