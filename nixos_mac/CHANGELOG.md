# Changelog

## [Unreleased] - 2025-07-26

### Added
- **CHANGELOG.md**: Created to track all changes made during macOS migration
- **install.sh**: Added macOS installation script with the following features:
  - Automatic Nix installation if not present
  - Flakes support configuration
  - System architecture detection (Apple Silicon/Intel)
  - User-specific configuration validation
- **README.md**: Added comprehensive documentation including:
  - Prerequisites for macOS
  - Installation instructions
  - Package list and configuration details
  - Troubleshooting guide
- **System Support**:
  - Added Apple Silicon (`aarch64-darwin`) support
  - Added Intel Mac (`x86_64-darwin`) support

### Changed
- **flake.nix**: Completely restructured for macOS compatibility
  - Before: Linux-specific architecture (`x86_64-linux`)
  - After: macOS architecture support with proper activation scripts
  - Added proper package initialization for macOS
  - Simplified configuration structure

- **home.nix**: Updated user configuration
  - Home directory:
    - Before: `/home/rajob`
    - After: `/Users/rajobraihan`
  - Package updates:
    - Before: `gcc`, `libgcc` (Linux-specific)
    - After: `clang` (macOS native)
  - Username updated from `rajob` to `rajobraihan`

- **configuration.nix**: System configuration changes
  - Removed WSL-specific settings
  - Added macOS-specific configurations
  - Updated package list for better macOS compatibility

### Removed
- **Linux-specific configurations**:
  - Removed WSL-specific settings
  - Removed systemd service configurations
  - Removed Linux kernel modules
- **Incompatible packages**:
  - Removed Linux desktop environment settings
  - Removed X11/Wayland configurations

### Fixed
- **Flake Configuration**:
  - Before: Failed to generate proper Home Manager configurations
  - After: Correctly generates macOS-compatible configurations
- **Path Issues**:
  - Before: Hardcoded Linux paths
  - After: Dynamic path resolution for macOS
- **Package Compatibility**:
  - Replaced or removed packages not available on macOS
  - Fixed dependency resolution for macOS

## [Pre-macOS] - 2025-07-25

### Initial Setup
- **Environment**: Linux/WSL specific configuration
- **Home Manager**: Basic setup with Linux-specific packages
- **Development Tools**:
  - Programming Languages: Go, Rust, Node.js, Python, Java
  - Shell: Fish with custom configurations
  - Version Control: Git with custom configurations
  - Editor: Neovim with custom setup
  - Terminal: Tmux configuration
- **System Configuration**:
  - WSL-specific settings
  - Linux kernel modules
  - Systemd services
