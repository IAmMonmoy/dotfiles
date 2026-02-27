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

3. **Install Home Manager** (if not already installed):
   ```bash
   nix profile add nixpkgs#home-manager
   ```

## Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Build and activate the Home Manager configuration:
   ```bash
   home-manager switch --flake /Users/rajobraihan/dotfiles/nixos_mac#rajobraihan
   ```

## Maintenance

### Nix Store Maintenance

1. **Run Garbage Collection**
   Periodically clean up unused packages to free up disk space:
   ```bash
   nix-collect-garbage
   ```
   - Use `nix-collect-garbage -d` to also delete old generations of your profile
   - Run this when you want to free up disk space or after major updates

2. **Optimize Nix Store**
   After garbage collection, optimize the store to reduce disk usage:
   ```bash
   nix-store --optimise
   ```
   - This deduplicates identical files in the Nix store
   - Particularly useful after installing/removing many packages

3. **When to Run**
   - After major system updates
   - When you notice significant disk space usage by Nix
   - Before creating system backups
   - Periodically (e.g., once a month)

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

### Roll Back to the Last Configuration

If a new activation causes issues, switch back to the previous Home Manager generation:

```bash
home-manager generations
home-manager switch --switch-generation -1
```

To roll back to a specific generation, use its generation number from `home-manager generations`:

```bash
home-manager switch --switch-generation <generation-number>
```

### Development Shell

To enter a development shell with additional tools:

```bash
nix develop
```

## Customization

1. **Username**: Update the username in `home.nix` and `flake.nix` if different from "rajob"
2. **Home Directory**: The configuration uses `/Users/rajob` - update if your username is different
3. **Packages**: Add or remove packages in the `home.packages` section of `home.nix`
4. **Shell Configuration**: Modify `home/fish.nix` for Fish shell customizations
5. **Editor Configuration**: Modify `home/nvim.nix` for Neovim customizations

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
