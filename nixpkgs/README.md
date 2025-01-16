# Install nix

## Install required packages
sudo apt-get update
sudo apt-get install curl xz-utils

## Install Nix (multi-user installation)
sh <(curl -L https://nixos.org/nix/install) --daemon

## Source 
. ~/.nix-profile/etc/profile.d/nix.sh

# Install home-manager

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install


# Run after each change
home-manager switch --flake .#${USER}
