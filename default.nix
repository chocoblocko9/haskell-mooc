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
    haskellPackages.cabal-install
    haskellPackages.haskell-language-server
    haskellPackages.hlint
    pkgs.zlib
  ];

  shellHook = ''
    PURPLE='\033[38;2;142;81;185m'
    BOLD_PURPLE='\033[1;38;2;142;81;185m'
    HASKELL_PURPLE='\033[1;38;2;142;81;185m'
    CABAL_BLUE='\033[1;38;2;92;84;164m'
    INTRO=" ''${BOLD_PURPLE} | ''${NC}"
    NC='\033[0m'

    clear
    echo -e "''${INTRO}''${BOLD_PURPLE}ghc: $(ghc --version)''${NC}"
    echo -e "''${INTRO}''${CABAL_BLUE}cabal:$(cabal --version)''${NC}"
    echo ""
    echo -e "''${INTRO}''${NC}Welcome! Enjoy the ''${BOLD_PURPLE}Haskell''${NC} learning :D"

    precmd() { PROMPT='%F{#8E51B9} %f %F{#5C54A4}%n@%m%f:%1~ > ' }
  '';
}
