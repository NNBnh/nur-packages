{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "pepper";
  version = "0.26.1";

  src = fetchCrate {
    inherit pname version;
    sha = "sha256-rHt0lBFFrpE5M1iqEjqB9Ol32bQTb2UVsWxCTOjQfR4=";
  };

  cargoSha256 = "19fnjzflbj17l3gh0i5ib71jbf6s57p28npjb4nv0f458q907mwj";

  meta = with lib; {
    description = "A simple and opinionated modal code editor for your terminal";
    homepage = "https://vamolessa.github.io/pepper/";
    license = licenses.gpl3Plus;
  };
}
