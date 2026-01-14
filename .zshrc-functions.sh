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

# Usage:
# killport PORT_NUMBER
killport() {
  local target_port=$1
  local pid=$(lsof -ti:"$target_port")
  kill $pid && lsof -i :"$target_port"
}

# Toggle between Latte and Frappe theme in Ghostty
toggle_theme() {
    local conf="${1:-$HOME/.config/ghostty/config}"
    if grep -q '^[[:space:]]*theme = "Catppuccin Frappe"' "$conf"; then
        use_latte "$conf"
    else
        use_frappe "$conf"
    fi
}

# Switch Ghostty to Catppuccin Latte
use_latte() {
    local conf="${1:-$HOME/.config/ghostty/config.toml}"
    # comment out any frappe line, uncomment latte
    sed -i -E \
        -e 's@^[[:space:]]*theme = "Catppuccin Frappe"@# theme = "Catppuccin Frappe"@' \
        -e 's@^[[:space:]]*# theme = "Catppuccin Latte"@theme = "Catppuccin Latte"@' \
        "$conf"
}

# Switch Ghostty to Catppuccin Frappe
use_frappe() {
    local conf="${1:-$HOME/.config/ghostty/config.toml}"
    # comment out any latte line, uncomment frappe
    sed -i -E \
        -e 's@^[[:space:]]*theme = "Catppuccin Latte"@# theme = "Catppuccin Latte"@' \
        -e 's@^[[:space:]]*# theme = "Catppuccin Frappe"@theme = "Catppuccin Frappe"@' \
        "$conf"
}

movtomp4() {
    if [ "$#" -ne 1 ]; then
      echo "Usage: movtomp4 input.mov" >&2
      return 2
    fi

    local input="$1"
    local ext="${input##*.}"

    if [ "$ext" != "mov" ] && [ "$ext" != "MOV" ]; then
      echo "movtomp4: input must be a .mov file" >&2
      return 2
    fi

    local output="${input%.*}.mp4"

    # -crf Constant Rate Factor
    # Lower CRF = higher quality + bigger file
    # Higher CRF = lower quality + smaller file

    ffmpeg -i "$input" \
      -c:v libx264 -preset slow -crf 20 \
      -movflags +faststart \
      -c:a aac -b:a 128k \
      "$output"
}

