alias rm='rm -i'
alias cp='cp -i'
alias lg='lazygit'
alias ld='lazydocker'

alias deval='eval "$(docker-machine env default)"'

# restart wifi
alias wifionoff='networksetup -setairportpower airport off; networksetup -setairportpower airport on'

alias git-update-fork="git checkout main && git fetch origin && git merge origin/main && git push fork main && git push --tags fork"
alias dk="docker"
alias dkc="docker-compose"

# Play a different sound according to the result of previously called command
# Kudos to https://evanhahn.com/a-decade-of-dotfiles/
# Usage:
# $ yarn test ; boop
boop() {
  local last="$?"
  if [[ "$last" == '0' ]]; then
    # success
    afplay ~/dotfiles/sounds/mixkit-trumpet-fanfare-2293.wav
  else
    # error
    afplay ~/dotfiles/sounds/mixkit-trumpets-and-strings-off-beat-2286.wav
  fi
  $(exit "$last")
}
