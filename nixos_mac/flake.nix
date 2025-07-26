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
      
      homeConfiguration = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
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
      
    in {
      # Build the home configuration directly
      defaultPackage.${system} = homeConfiguration.activationPackage;
      
      # For `nix run`
      apps.${system}.default = {
        type = "app";
        program = "${homeConfiguration.activationPackage}/activate";
      };
      
      # For development environment
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          git
          go
          ghq
          peco
        ];
      };
    };
}
