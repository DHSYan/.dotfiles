{
  description = "Flakes for Everything";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        # extraSpecialArgs = {inherit inputs;};
	modules = [ ./configuration.nix ];
      };
      #homeConfigurations."tzen" = home-manager.lib.homeManagerConfiguration {
      #  inherit pkgs;

      #  modules = [ ./home.nix ];

      #};
    };
}
