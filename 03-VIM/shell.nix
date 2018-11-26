with import <nixpkgs> {};

pkgs.stdenv.mkDerivation rec {
  name = "vim";

  buildInputs = [
    vimHugeX
  ];
}
