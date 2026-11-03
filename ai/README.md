# AI

## Claude Code status line

`statusline.sh` shows:

- the current repo and branch
- the current directory
- how much of the context window is used
- the session cost so far
- the model

For example:

```
dotfiles:main | ~/dotfiles | ctx 12% | $1.23 | Opus 5.5 (1M context)
```

Context usage is green below 40%, yellow from 40% and red from 60%.

### Prerequisites

- `jq`
- `git`

### Setup

Symlink the script into the Claude config directory

```sh
ln -sf ~/dotfiles/ai/statusline.sh ~/.claude/statusline.sh
```

Add the `statusLine` setting to `~/.claude/settings.json`

```json
{
  "statusLine": {
    "type": "command",
    "command": "bash ~/.claude/statusline.sh"
  }
}
```

The status line appears with the next prompt. Restart Claude Code if it doesn't.
