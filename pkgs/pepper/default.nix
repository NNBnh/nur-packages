{ lib, fetchCrate, rustPlatform, fetchFromGitHub }:

with import <nixpkgs> {};
let src = fetchFromGitHub {
      owner = "mozilla";
      repo = "nixpkgs-mozilla";
      rev = "e1f7540fc0a8b989fb8cf701dc4fd7fc76bcf168";
      sha256 = "1b6p0rly0rywq60ks84ghc0n5zrqiafc2r64nlbnlkh9whmh5fmj";
   };
in
with import "${src.out}/rust-overlay.nix" pkgs pkgs;
rustPlatform.buildRustPackage rec {
  pname = "pepper";
  version = "0.26.1";
  nativeBuildInputs = [
    latest.rustChannels.stable.rust
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
