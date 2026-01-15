# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

This repository uses fine-grained package organization with separate directories for each application or category:

### Core Packages
- **bash/** - Minimal Bash configuration (`.bashrc`, `.profile`, `.bash_logout`)
- **zsh/** - Zsh configuration including Powerlevel10k theme (`.zshrc`, `.p10k.zsh`, `powerlevel10k/`)
- **git/** - Git configuration (`.gitconfig`)
- **ssh/** - SSH configuration (config only, no keys)
- **docker/** - Docker configuration

### System Packages
- **desktop/** - Cinnamon desktop environment configs (cinnamon, gtk, nemo, autostart, dconf)
- **themes/** - Themes, fonts, and icons (`.fonts/`, `.icons/`, `.themes/`, `.gtkrc-*`)
- **terminals/** - Terminal emulator configs (kitty, ghostty)
- **system-monitor/** - System monitoring tools (conky, btop, htop)
- **scripts/** - Personal scripts directory (`bin/`)

### Development Tools
- **dev-tools/** - Development applications (VS Code, gcloud, GitHub Desktop, oh-my-posh)
- **cloud/** - Cloud service configs (boto, conda)
- **database/** - Database configs (MySQL)

### Utilities
- **nvidia/** - NVIDIA settings
- **audio/** - Audio configuration (JACK)
- **vim/** - Vim configuration (if present)

### Applications
- **creative/** - Creative applications (Inkscape, GIMP, Blender, Audacity, Kdenlive, FreeCAD, OrcaSlicer, BambuStudio)
- **media/** - Media players (Spotify, MPV, VLC)
- **apps/** - Other applications (Discord, rclone, Transmission)

## Installation

### Prerequisites

Install GNU Stow:
```bash
sudo apt-get install stow  # Debian/Ubuntu/Mint
```

### Deploy All Packages

From the `~/.dotfiles` directory:
```bash
cd ~/.dotfiles
stow */
```

### Deploy Specific Packages

```bash
cd ~/.dotfiles
stow bash zsh git     # Deploy only shell and git configs
stow terminals        # Deploy terminal configs
stow creative media   # Deploy creative and media apps
```

### Remove Packages

To unstow (remove symlinks):
```bash
cd ~/.dotfiles
stow -D <package-name>
```

## Usage

### Adding New Dotfiles

1. Create a package directory in `~/.dotfiles/` (e.g., `vim/`)
2. Mirror your home directory structure inside the package
3. Move your config files into the package
4. Deploy with stow: `stow vim`

Example:
```bash
mkdir -p ~/.dotfiles/vim
cp ~/.vimrc ~/.dotfiles/vim/
stow vim
```

### Updating Configs

Edit files directly in `~/.dotfiles/` packages - they're symlinked to your home directory.

### Testing Before Deploy

Use dry-run mode to check for conflicts:
```bash
stow -n <package-name>
```

## Git Management

### Files Excluded from Git

The `.gitignore` excludes:
- SSH private keys and credentials
- Docker credentials
- VS Code caches and extensions (1.6GB+)
- Binary files and AppImages (2.2GB+)
- Cache directories and logs
- Runtime and temporary files

### Commit and Push

```bash
git add .
git commit -m "Update dotfiles"
git push origin main
```

## Backup

Original configs archived in:
- `~/old-configs/` - Old/stale configs, histories, browser profiles
- `~/.legacy/` - Recently replaced configs before stowing

## Notes

- **Bash configs**: Minimal, clean versions - originals were stale
- **Zsh configs**: Active configuration with Powerlevel10k theme
- **SSH**: Only `config` file is managed, private keys stay local
- **Docker**: Config included but credentials are git-ignored
- **Scripts**: Contains personal binaries (git-ignored) and scripts

## License

Personal dotfiles - use at your own risk!
