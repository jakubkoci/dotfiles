# AI

## Claude Code status line

`statusline.sh` shows:

- the repo and branch, marked `(branch)` in a normal checkout or `(worktree)` in a worktree, or the commit marked `(detached)` with no branch checked out; inside a worktree the repo is the main repo's name
- how much of the context window is used
- the session cost so far
- the model

For example:

```
dotfiles:main (branch) | ctx 12% | $1.23 | Opus 5.5 (1M context)
```

Outside a git repo the current directory takes the place of repo and branch. Context usage is green below 40%, yellow from 40% and red from 60%.

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
