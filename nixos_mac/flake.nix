{
  description = "Home Manager configuration for rajobraihan";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "aarch64-darwin";  # or "x86_64-darwin" for Intel Macs
      username = "rajobraihan";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      commonPackages = import ./home/common_packages.nix { inherit pkgs; };

      lib = nixpkgs.lib;

    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify the path to your home configuration here
        modules = [
          {
            home = {
              inherit username;
              homeDirectory = "/Users/${username}";
              stateVersion = "23.11";
            };
          }
          ./home.nix
        ];
      };

      # This makes the home-manager package available through the flake
      packages.${system}.default = home-manager.packages.${system}.default;

      # For `nix run`
      apps.${system}.default = {
        type = "app";
        program = "${self.homeConfigurations.${username}.activationPackage}/activate";
      };

      # For development environment
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = commonPackages ++ (with pkgs; [
          git
          perl
          findutils
          gnused
          coreutils
          nixpkgs-fmt
          rnix-lsp
        ]);

        # Set up the environment
        shellHook = ''
          # Add Nix profile binaries to PATH
          export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH

          # Ensure fish is in /etc/shells
          if ! grep -q "${pkgs.fish}/bin/fish" /etc/shells; then
            echo "${pkgs.fish}/bin/fish" | sudo tee -a /etc/shells
          fi

          # Set default shell to fish if not already set
          if [ "$SHELL" != "${pkgs.fish}/bin/fish" ]; then
            chsh -s ${pkgs.fish}/bin/fish
          fi
        '';
      };

      # Legacy output for compatibility
      defaultPackage.${system} = self.homeConfigurations.${username}.activationPackage;
    };
}
