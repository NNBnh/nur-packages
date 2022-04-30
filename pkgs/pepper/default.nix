{ lib, pkgs, fetchCrate, rustPlatform }:

let
  unstable = pkgs.callPackage (builtins.fetchTarball "https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz") {};
in rustPlatform.buildRustPackage rec {
  pname = "pepper";
  version = "0.26.1";
  nativeBuildInputs = [
    unstable.rustc
  ];

  src = fetchCrate {
    inherit pname version;
    sha256 = "07kxs3l4qhkcn4anavqknkcpgsglh4x15ajq6cwr3bj526a78yxc";
  };

  cargoSha256 = "0n67a959d8yps5322glv8qgbq4ikv4z9l2wsd4g9jpwf591mhpa8";

  meta = with lib; {
    description = "A simple and opinionated modal code editor for your terminal";
    homepage = "https://vamolessa.github.io/pepper/";
    license = licenses.gpl3Plus;
  };
}
