{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d233902339c02a9c334e7e593de68855ad26c4cb.tar.gz") {} }:
# fairywren: 0-unstable-2026-05-06 -> 0-unstable-2026-05-15 (#520569)
# nixos-unstable
# 15/05/26

let
  haskellPackages = pkgs.haskell.packages.ghc96;
in
pkgs.mkShell {
  buildInputs = [
    haskellPackages.ghc
    pkgs.cabal-install
    haskellPackages.haskell-language-server
    haskellPackages.hlint
    pkgs.zlib
  ];
}
