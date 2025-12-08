#!/usr/bin/env bash

# Toggle macOS dark mode and switch iTerm profiles
# Light  -> Catppuccin Frappe (dark)
# Dark   -> Catppuccin Latte (light)

# 1. Check current macOS dark mode
is_dark=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')

if [ "$is_dark" = "true" ]; then
  new_dark=false
  new_profile="Light"   # going to light
else
  new_dark=true
  new_profile="Dark"  # going to dark
fi

# 2. Toggle macOS dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to $new_dark"
