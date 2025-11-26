{
  description = "Dev Shells for general use cases";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        devShells = {
          typst = pkgs.mkShell {
            buildInputs = with pkgs; [
              typst
              tinymist
            ];

          };
          cpp = {};
          python = {};
          ts = {};
          rust = {};
        };
      });
}
