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
  pname = "pepper-plugin-lsp";
  version = "0.13.0";
  nativeBuildInputs = [
    latest.rustChannels.stable.rust
  ];

  src = fetchCrate {
    inherit pname version;
    sha256 = "1x7dgqfkfgam2p0smy905pwmw8ra2p6xcswrw7z75ibr066amijy";
  };

  cargoSha256 = "0zlzfghmjsjs7fqx07fgfns0qpyn36wk5ngz2pm44gikizxs2zp4";

  meta = with lib; {
    description = "Pepper editor with Language Server Protocol plugin";
    homepage = "https://vamolessa.github.io/pepper/";
    license = licenses.gpl3Plus;
  };
}
