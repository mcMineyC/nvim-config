{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation {
  name = "nvim-config";
#   src = ./;

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
  ];

  phases = [
    "unpackPhase"
    "buildPhase"
    "installPhase"
    # "postFixup"
    # "myPersonalConfusingPhase"
  ];

#   buildPhase = ''
#     g++ hello-world.cpp -o hello-world
#   '';

  # buildPhase = ''
  #   g++ hello-world.cpp -o hello-world -lncurses
  # '';

  installPhase = ''
    mkdir -p $out
    cp . $out
  '';

#   postFixup = ''
#     wrapProgram $out/bin/hello-world \
#       --set PATH ${pkgs.lib.makeBinPath (with pkgs; [
#         cowsay
#       ])}
#   '';

  # myPersonalConfusingPhase = ''
  #   echo "hi" > $out/hi
  # '';
}