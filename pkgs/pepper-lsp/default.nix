{ lib, fetchCrate, rustPlatform }:

with import <nixpkgs> {
  overlays = [
    (import (fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"))
  ];
};

rustPlatform.buildRustPackage rec {
  pname = "pepper-plugin-lsp";
  version = "0.13.0";
  nativeBuildInputs = [
    rust-bin.stable.latest.minimal
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
