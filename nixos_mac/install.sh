#!/bin/bash

# macOS Dotfiles Installation Script
# This script helps set up the Nix-based dotfiles configuration on macOS

set -e

echo "🍎 macOS Dotfiles Setup Script"
echo "=============================="

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is designed for macOS only."
    exit 1
fi

# Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo "📦 Nix is not installed. Installing Nix..."
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    
    # Source the nix profile
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
else
    echo "✅ Nix is already installed."
fi

# Check if flakes are enabled
NIX_CONFIG_DIR="$HOME/.config/nix"
NIX_CONFIG_FILE="$NIX_CONFIG_DIR/nix.conf"

if [ ! -f "$NIX_CONFIG_FILE" ] || ! grep -q "experimental-features.*flakes" "$NIX_CONFIG_FILE"; then
    echo "🔧 Enabling Nix flakes..."
    mkdir -p "$NIX_CONFIG_DIR"
    echo "experimental-features = nix-command flakes" >> "$NIX_CONFIG_FILE"
else
    echo "✅ Nix flakes are already enabled."
fi

# Detect system architecture
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    SYSTEM="x86_64-darwin"
elif [[ "$ARCH" == "arm64" ]]; then
    SYSTEM="aarch64-darwin"
else
    echo "❌ Unsupported architecture: $ARCH"
    exit 1
fi

echo "🖥️  Detected system: $SYSTEM"

# Get the current username
USERNAME=$(whoami)
echo "👤 Current user: $USERNAME"

# Check if the username in the configuration matches
if ! grep -q "username = \"$USERNAME\"" home.nix; then
    echo "⚠️  Warning: The username in home.nix doesn't match your current username ($USERNAME)."
    echo "   You may need to update the username in home.nix and flake.nix before proceeding."
    read -p "   Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Installation cancelled."
        exit 1
    fi
fi

# Install Home Manager and apply configuration
echo "🏠 Installing Home Manager and applying configuration..."

# First, let's try to build the configuration to check for any issues
echo "🔍 Testing configuration build..."
if nix build ".#homeConfigurations.$USERNAME" --no-link; then
    echo "✅ Configuration builds successfully."
else
    echo "❌ Configuration build failed. Please check your configuration files."
    exit 1
fi

# Apply the Home Manager configuration
echo "🚀 Applying Home Manager configuration..."
nix run home-manager/master -- switch --flake ".#$USERNAME"

echo ""
echo "🎉 Installation complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your terminal or run: source ~/.nix-profile/etc/profile.d/hm-session-vars.sh"
echo "   2. If you use Fish shell, it should now be available as your default shell"
echo "   3. Run 'home-manager switch --flake .#$USERNAME' to apply future configuration changes"
echo ""
echo "🔧 To customize your setup:"
echo "   - Edit home.nix to add/remove packages"
echo "   - Modify files in the home/ directory for specific tool configurations"
echo "   - See README.md for more detailed instructions"
echo ""
echo "Happy coding! 🚀"
