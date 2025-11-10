# Raycast Configuration

This directory contains your Raycast snippets in a clean, human-readable JSON format that's perfect for version control.

## Snippets Management

Raycast snippets are text expansions that work anywhere on your Mac. This repo stores them as `snippets.json` so you can:
- Edit them directly in your text editor
- Track changes in git
- Sync them across machines
- Back them up

### Current Snippets

The `snippets.json` file contains all your snippets with:
- `keyword`: The trigger text (e.g., `@mail`, `$gsm`)
- `text`: What gets expanded
- `name`: A human-readable description

## Initial Setup (First Export)

1. Open Raycast and type: `Export Snippets`
2. Save as: `~/Projects/sgraczyk/dotfiles/raycast/snippets.json`
3. Commit to git:
   ```bash
   cd ~/Projects/sgraczyk/dotfiles
   git add raycast/snippets.json
   git commit -m "Add Raycast snippets"
   git push
   ```

## Importing on a New Machine

After cloning your dotfiles, import your snippets:

### Option 1: Use the helper script (easiest)
```bash
cd ~/Projects/sgraczyk/dotfiles/raycast && ./import-snippets.sh
```
This will open the Import Snippets command and reveal the file in Finder.

### Option 2: Manual import
1. Open Raycast
2. Type: `Import Snippets`
3. Select: `~/Projects/sgraczyk/dotfiles/raycast/snippets.json`
4. Raycast will show how many snippets were imported

## Updating Snippets

When you add or modify snippets in Raycast:

1. Export again: Open Raycast → `Export Snippets`
2. Replace the existing `snippets.json` in this directory
   - **Note**: Your old version is safely tracked in git history, so no separate backup is needed
3. Commit the changes:
   ```bash
   cd ~/Projects/sgraczyk/dotfiles
   git add raycast/snippets.json
   git commit -m "Update Raycast snippets"
   git push
   ```

## Editing Snippets Manually

You can also edit `snippets.json` directly in your text editor:

```json
[
  {
    "keyword": "@mail",
    "text": "your@email.com",
    "name": "My email"
  }
]
```

After editing, use the Import Snippets command to load the updated snippets into Raycast.

### Security Warning

⚠️ **Important**: Be careful not to commit sensitive information to your repository:
- API keys or tokens
- Passwords or credentials
- Private IP addresses or internal URLs (if repo is public)
- Personal information you don't want public

Consider using a private repository or keeping sensitive snippets in a separate, gitignored file.

## Alternative: Full Configuration Export

If you want to backup more than just snippets (aliases, hotkeys, quicklinks, etc.):

1. Type: `Export Preferences & Data`
2. Save as: `Raycast.rayconfig` in this directory
3. Import using: `Import Preferences & Data`

Note: `.rayconfig` files are not human-readable, so we prefer the JSON format for snippets.

## Alternative: Cloud Sync

Raycast Pro includes automatic Cloud Sync:
1. Open Raycast Settings → Cloud Sync
2. Enable Cloud Sync

This syncs snippets automatically across Macs, but they won't be in version control.
