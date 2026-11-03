#!/usr/bin/env bash
# Claude Code status line: repo:branch (worktree|branch) | context % | cost | model
# Outside a git repo the directory replaces repo:branch
input=$(cat)

model=$(jq -r '.model.display_name // .model.id // "?"' <<<"$input")
cwd=$(jq -r '.workspace.current_dir // .cwd // empty' <<<"$input")
[ -z "$cwd" ] && cwd=$PWD

# Context usage: prefer the precomputed percentage, else derive from current_usage
pct=$(jq -r '
  if .context_window.used_percentage != null then .context_window.used_percentage
  elif .context_window.current_usage != null and (.context_window.context_window_size // 0) > 0 then
    (.context_window.current_usage
      | (.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)
    ) * 100 / .context_window.context_window_size
  else empty end
  | floor' <<<"$input" 2>/dev/null)
cost=$(jq -r '.cost.total_cost_usd // empty' <<<"$input")

repo=""; branch=""; kind=""
if common=$(git -C "$cwd" rev-parse --path-format=absolute --git-common-dir 2>/dev/null); then
  # The shared git dir names the main repo, also from inside a worktree
  gitdir=$(git -C "$cwd" rev-parse --path-format=absolute --git-dir)
  [ "$gitdir" != "$common" ] && kind="worktree" || kind="branch"
  [ "$(basename "$common")" = ".git" ] && common=$(dirname "$common")
  repo=$(basename "$common" .git)
  if ! branch=$(git -C "$cwd" symbolic-ref --short -q HEAD 2>/dev/null); then
    branch=$(git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
    kind="detached"
  fi
fi

# Colors
dim=$'\033[2m'; reset=$'\033[0m'
cyan=$'\033[36m'; blue=$'\033[34m';
if [ -n "$pct" ]; then
  if [ "$pct" -ge 60 ]; then pc=$'\033[31m'; elif [ "$pct" -ge 40 ]; then pc=$'\033[33m'; else pc=$'\033[32m'; fi
  ctx="${pc}ctx ${pct}%${reset}"
else
  ctx="${dim}ctx --${reset}"
fi

if [ -n "$cost" ]; then
  cost_txt="$(printf '$%.2f' "$cost")"
else
  cost_txt="${dim}\$--${reset}"
fi

sep=" ${dim}|${reset} "
if [ -n "$repo" ]; then
  out="${cyan}${repo}:${branch:-?}${reset} ${dim}(${kind})${reset}"
else
  dir=${cwd/#$HOME/\~}
  out="${blue}${dir}${reset}"
fi
out+="${sep}${ctx}${sep}${cost_txt}${sep}${model}"
printf '%s' "$out"
