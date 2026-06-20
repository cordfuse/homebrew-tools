<!-- parent: librarian -->
# homebrew-tools

Homebrew tap for Cordfuse tools. One formula per Cordfuse project.

## Structure

```
Formula/          # One .rb file per tool — currently empty
```

## Adding a formula

Create a new `.rb` in `Formula/`. Each project's release pipeline should update its own formula via a `homebrew.yml` workflow in that project's repo. Use the old `cortex-setup.rb` (in git history) as a reference.

## Tap

`brew tap cordfuse/tools` → maps to this repo (`cordfuse/homebrew-tools`).
