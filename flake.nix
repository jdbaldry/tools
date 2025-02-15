{
  description = "tools shell development tooling";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs {
        inherit system; overlays = [
        (final: prev: {
          modularise = prev.callPackage ./modularise.nix { pkgs = prev; };
        })
      ];
      };
      in { devShell = import ./shell.nix { inherit pkgs; }; }));
}
