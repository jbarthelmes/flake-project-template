{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
    utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";
  };

  outputs = inputs@{ self, nixpkgs, utils, devshell, ... }:
    utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        mkShell = devshell.legacyPackages.${system}.mkShell;
      in {
        devShell = mkShell (import nix/devshell.nix pkgs);
        packages.hello = pkgs.hello;
      });
}
