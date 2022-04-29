{ lib, fetchCrate, rustPlatform, fetchFromGitHub }:

with import <nixpkgs> {
  overlays = [
    (import
      (
        fetchFromGitHub {
          owner = "oxalica";
          repo = "rust-overlay";
          rev = "403f362c5d921764bae021cf6c8bd669a51fddd4";
          sha256 = "1hqps7l5qrjh9f914r5i6kmcz6f1yb951nv4lby0cjnp5l253kps";
        }
      )
    )
  ];
};

rustPlatform.buildRustPackage rec {
  pname = "pepper";
  version = "0.26.1";
  nativeBuildInputs = [
    rust-bin.stable.latest.minimal
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
