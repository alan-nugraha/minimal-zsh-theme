# Minimal ZSH Theme

A clean and efficient ZSH theme with smart path handling and git integration.

## Features

- **Smart Path Truncation**: Intelligently displays paths based on context
  - Inside git repos: shows repo root + current subdirectory
  - Outside git repos: shows last 3 path segments
  - Long paths are truncated with ellipsis (…)
- **Git Integration**:
  - Branch name display with angle brackets ‹branch›
  - Dirty state indicator (red asterisk)
  - Git action states (rebase, merge, etc.)
- **Clean Visual Design**:
  - Hostname display
  - Color-coded elements (blue, green, yellow, red)
  - Double colon (::) separator
  - Chevron (») prompt character

## Preview

<img width="972" height="611" alt="Image" src="https://github.com/user-attachments/assets/45413615-6257-489f-b01e-528ba50145fe" />

## Installation

### Standalone (without Oh-My-Zsh)

1. Copy the theme file to your ZSH themes directory:
```bash
mkdir -p ~/.zsh/themes
cp minimal.zsh-theme ~/.zsh/themes/
```

2. Source the theme in your `~/.zshrc`:
```bash
source ~/.zsh/themes/minimal.zsh-theme
```

3. Reload your shell:
```bash
source ~/.zshrc
```

## Color Scheme

- **Blue**: Hostname and separators
- **Green**: Current path
- **Yellow**: Git branch name
- **Red**: Dirty state indicator

## Requirements

- ZSH shell
- Git (for git integration features)

## Credits

Inspired by [afowler](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/afowler.zsh-theme) theme from Oh-My-Zsh.

## License

Free to use and modify.
