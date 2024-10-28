{
  description = "Sean's Dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay/master";
    };

    flake-utils.url = "github:numtide/flake-utils";

  };

  outputs = { nixpkgs, flake-utils, ... } @ inputs: 
      # flake-utils.lib.eachDefaultSystem 
      # (system:
        let 
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system}; 
        in
        {
           devShells.${system} = {
               # default = pkgs.mkShell {
               # };
            nvim = pkgs.mkShell {
              packages = with pkgs; [ 
              zsh
              inputs.neovim-nightly.packages.${system}.default
              ripgrep 
              ] ;
              shellHook = ''
                ln -i -s "$(pwd)/nvim" "$HOME/.config/dhsynvim"

                nvim -c "Lazy! sync" 
              '';
              env = {
                  NVIM_APPNAME = "dhsynvim";
              };
            };
          };

        };
      # );
      

      #   devShells = {
      #           default = pkgs.mkShell {
      #           packages = with pkgs; [
      #           inputs.neovim-nightly.packages.${pkgs.system}.default
      #           ripgrep
      #           ];
      #     shellHook = ''
      #     ln -s "$(pwd)" "$HOME/.config/pwnvim"
      #     echo "Syncing Neovim plugins ..."
      #       nvim --headless +"Lazy! sync" +qa
      #     '';
      #
      #     env = {
      #
      #       NVIM_APPNAME = "pwnvim";
      #
      #     };
      #
      #   };
      # });
}
