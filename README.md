# homebrew-tools

Homebrew tap for [Cordfuse](https://github.com/cordfuse) tools.

## Usage

```bash
brew tap cordfuse/tools
```

Then install any Cordfuse tool:

```bash
brew install <formula-name>
```

## Formulae

| Tool | Install |
|------|---------|
| **vyzr** (CLI) | `brew install cordfuse/tools/vyzr` |
| **vyzr** (desktop app) | `brew install --cask cordfuse/tools/vyzr` |

Each Cordfuse project's release pipeline auto-bumps its own formula on tag push.

## Adding a formula

Place the `.rb` file in `Formula/`. The release pipeline for each Cordfuse project updates its formula automatically on tag push.
