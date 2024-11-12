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
          (import ./nix/fix-ghc-pkgs-overlay.nix system)
        ];

        pkgs = import nixpkgs { inherit system overlays; inherit (haskellNix) config; };

        flake = compiler-nix-name: src: (pkgs.hixProject compiler-nix-name src [{
          configureFlags = [
            ''--ghc-options="-with-rtsopts=-M12G"''
          ];
        }]).flake {};

        flakeStatic = compiler-nix-name: src: (pkgs.pkgsCross.musl64.hixProject compiler-nix-name src [{
          packages.th-crash-repro.components.exes.th-crash-repro.dontStrip = false;
          packages.th-crash-repro.components.exes.th-crash-repro.enableShared = false;
          packages.th-crash-repro.components.exes.th-crash-repro.configureFlags = [
            ''--ghc-options="-pgml g++ -optl=-fuse-ld=gold -optl-Wl,--allow-multiple-definition -optl-Wl,--whole-archive -optl-Wl,-Bstatic -optl-Wl,-Bdynamic -optl-Wl,--no-whole-archive"''
          ];
          packages.th-crash-repro.components.exes.th-crash-repro.libs = [];
          packages.th-crash-repro.components.exes.th-crash-repro.build-tools = [pkgs.pkgsCross.musl64.gcc];
        }]).flake {};

        srcWithStackYaml = stackYaml: let
          baseSrc = gitignore.lib.gitignoreSource ./.;
        in
          pkgs.runCommand "src-with-${stackYaml}" {} ''
            cp -r ${baseSrc} $out
          '';

        exeAttr = "th-crash-repro:exe:th-crash-repro";

      in
        rec {
          packages = rec {
            default = (flake "ghc966" (srcWithStackYaml "stack.yaml")).packages.${exeAttr};
          };

          inherit flake;
        }
    );
}
