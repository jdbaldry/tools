{ pkgs ? import <nixpkgs> }:

with pkgs;
mkShell {
  buildInputs = [ go_1_17 modularise ];
}
