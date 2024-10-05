{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation {
  name = "nvim-config";

  buildInputs = with pkgs; [
    neovim
      tree-sitter
      nodejs_22
      nodePackages.npm
      python3
      python312Packages.pip
      gccgo14
      wl-clipboard-x11
      wl-clipboard
      unzip
      clang-tools
  ];

  phases = [
    "installPhase"
  ];

  installPhase = ''
    mkdir -p $out
    cp -r . $out
  '';
}
