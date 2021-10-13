{ pkgs ? import <nixpkgs> }:

with pkgs;
buildGoModule rec {
  pname = "modularise";
  version = "0.4.1";

  doCheck = false;
  src = fetchFromGitHub {
    owner = "modularise";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-I4un2bgnWJSgBA05HgbgYtic+xHLgeeqi2YHUz8Od0M=";
  };
  subPackages = [ ];
  vendorSha256 = "sha256-yEFqlFEWXRASvENGE0M4P1YILfBCn2nm3iiuE3fs6uA=";

  meta = with lib; {
    description = "Split a repo into Go modules";
    homepage = "https://github.com/modularise/modularise";
    license = licenses.mit;
    maintainers = with maintainers; [ jdbaldry ];
  };
}
