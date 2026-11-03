#!/usr/bin/env bash
# Claude Code status line: repo | directory | context % | cost | model
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

repo=""
if top=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null); then
  repo=$(basename "$top")
  branch=$(git -C "$cwd" symbolic-ref --short -q HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  [ -n "$branch" ] && repo="$repo:$branch"
fi

dir=${cwd/#$HOME/\~}

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
out=""
[ -n "$repo" ] && out="${cyan}${repo}${reset}${sep}"
out+="${blue}${dir}${reset}${sep}${ctx}${sep}${cost_txt}${sep}${model}"
printf '%s' "$out"
