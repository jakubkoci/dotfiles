alias rm='rm -i'
alias cp='cp -i'
alias lyg='lazygit'
alias lyd='lazydocker'
alias dk="docker"
alias dkc="docker-compose"
alias pn='pnpm'

# Update fork main based on origin main
alias git-update-fork="git checkout main && git fetch origin && git merge origin/main && git push fork main && git push --tags fork"

# Restart wifi
alias wifionoff='networksetup -setairportpower airport off; networksetup -setairportpower airport on'
