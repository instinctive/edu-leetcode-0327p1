{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc924" }:
nixpkgs.pkgs.haskell.packages.${compiler}.callCabal2nix "leet" (./.) {}
