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

_No formulae currently published._

The first formula here was `vyzr` (CLI + desktop cask), removed 2026-06-26 when `cordfuse/vyzr` was archived. Future Cordfuse tools that ship a single-machine binary will land their formulae here.

## Adding a formula

Place the `.rb` file in `Formula/`. The release pipeline for each Cordfuse project updates its formula automatically on tag push.
