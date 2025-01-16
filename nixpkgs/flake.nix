{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."rajob" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        modules = [ ./home.nix ];
      };

      # Add this devShell configuration
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
