{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.gitignore = {
    url = "github:hercules-ci/gitignore.nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";

  outputs = { self, flake-utils, gitignore, haskellNix, nixpkgs }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [
          haskellNix.overlay
          (final: prev: {
            hixProject = compiler-nix-name: src: extraModules:
              final.haskell-nix.hix.project {
                inherit src;
                evalSystem = system;
                inherit compiler-nix-name;
                modules = extraModules;
              };
          })
        ];

        pkgs = import nixpkgs { inherit system overlays; inherit (haskellNix) config; };

        flake = (pkgs.hixProject "ghc966" (gitignore.lib.gitignoreSource ./.) []).flake {};

      in
        rec {
          packages = rec {
            default = flake.packages."th-crash-repro:exe:th-crash-repro";
          };

          inherit flake;
        }
    );
}
