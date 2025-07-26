# macOS Dotfiles with Nix and Home Manager

This repository contains Nix configuration files for setting up a development environment on macOS using Home Manager.

## Prerequisites

1. **Install Nix** (if not already installed):
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. **Enable Flakes** (if not already enabled):
   ```bash
   mkdir -p ~/.config/nix
   echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```

## Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Build and activate the Home Manager configuration:
   ```bash
   nix run home-manager/master -- switch --flake .#rajob
   ```

## What's Included

### Development Tools
- **Languages**: Go, Rust, Node.js, Python 3, Java (JDK 23), Clang
- **Build Tools**: gnumake, luajit, luarocks
- **Version Control**: git, lazygit, ghq

### Command Line Utilities
- **File Management**: eza (modern ls), tree-sitter, zip/unzip
- **Text Processing**: jq, fzf, peco
- **System Monitoring**: btop
- **Network**: wget, curl

### Shell and Terminal
- **Shell**: Fish shell with custom configuration
- **Terminal Multiplexer**: tmux with custom configuration
- **Editor**: Neovim with custom configuration

## Configuration Files

- `flake.nix` - Main flake configuration supporting both Intel and Apple Silicon Macs
- `home.nix` - Home Manager configuration with package definitions
- `home/` - Directory containing modular configurations:
  - `fish.nix` - Fish shell configuration
  - `git.nix` - Git configuration
  - `nvim.nix` - Neovim configuration
  - `tmux.nix` - Tmux configuration

## Usage

### Updating the Configuration

After making changes to any configuration files:

```bash
home-manager switch --flake .#rajob
```

### Development Shell

To enter a development shell with additional tools:

```bash
nix develop
```

### Architecture Support

This configuration supports both:
- Intel Macs (`x86_64-darwin`)
- Apple Silicon Macs (`aarch64-darwin`)

The appropriate packages will be selected automatically based on your system architecture.

## Customization

1. **Username**: Update the username in `home.nix` and `flake.nix` if different from "rajob"
2. **Home Directory**: The configuration uses `/Users/rajob` - update if your username is different
3. **Packages**: Add or remove packages in the `home.packages` section of `home.nix`
4. **Shell Configuration**: Modify `home/fish.nix` for Fish shell customizations
5. **Editor Configuration**: Modify `home/nvim.nix` for Neovim customizations

## Troubleshooting

### Common Issues

1. **Permission Errors**: Make sure Nix has the necessary permissions and try running with `sudo` if needed
2. **Architecture Mismatch**: The flake automatically detects your system architecture
3. **Package Not Found**: Some packages might not be available on macOS - check nixpkgs for alternatives

## Installation

### Prerequisites

1. **macOS**: Tested on macOS 14.0+ (Sonoma)
2. **Xcode Command Line Tools**: Required for development
   ```bash
   xcode-select --install
   ```
3. **Nix Package Manager**: Required for package management
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
   ```
   Restart your shell or run:
   ```bash
   . ~/.nix-profile/etc/profile.d/nix.sh
   ```

### Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles/nixos_mac
   ```

2. Run the installation script:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. Restart your terminal or source the new configuration:
   ```bash
   source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
   ```

## Managing Packages

### Adding New Packages

1. Edit `home.nix` and add packages to the `home.packages` list
2. Apply changes:
   ```bash
   nix run .#defaultPackage.aarch64-darwin
   ```
   or for Intel Macs:
   ```bash
   nix run .#defaultPackage.x86_64-darwin
   ```

### Updating Packages

1. Update the flake inputs:
   ```bash
   nix flake update
   ```

2. Rebuild your configuration:
   ```bash
   nix run .#defaultPackage.aarch64-darwin
   ```

3. To update a specific input (e.g., nixpkgs):
   ```bash
   nix flake lock --update-input nixpkgs
   ```

### Development Shell

Enter a development environment with all tools:
```bash
nix develop
```

## Troubleshooting

### Common Issues

1. **Command Not Found**
   - Ensure you've sourced the Nix environment:
     ```bash
     . ~/.nix-profile/etc/profile.d/nix.sh
     ```

2. **Permission Errors**
   - Make sure your user has write permissions to the Nix store:
     ```bash
     sudo chown -R $(whoami) /nix
     ```

3. **Broken Packages**
   - Try cleaning the Nix store:
     ```bash
     nix-collect-garbage -d
     nix-store --optimise
     ```

## Migration from Linux/WSL

This configuration has been updated from a Linux/WSL setup with the following key changes:

1. **System Architecture**: Changed from `x86_64-linux` to support `aarch64-darwin` (Apple Silicon) and `x86_64-darwin` (Intel)
2. **Home Directory**: Updated from `/home/rajob` to `/Users/rajobraihan`
3. **Compiler**: Replaced `gcc` and `libgcc` with `clang` for better macOS compatibility
4. **Package Selection**: Ensured all packages are compatible with macOS
5. **Path Handling**: Updated all hardcoded paths to use macOS conventions

## Getting Help

- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Package Search](https://search.nixos.org/packages)
- [Nix Darwin](https://github.com/LnL7/nix-darwin) for system-level configuration
- [NixOS Wiki](https://nixos.wiki/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
