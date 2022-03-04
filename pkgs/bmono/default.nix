{ lib, fetchzip }:

let
  version = "v1.2-11.2.2";
in fetchzip rec {
  name = "cosevka-${version}";
  url = "https://github.com/NNBnh/bmono/releases/download/${version}/bmono-ttf.zip";
  sha256 = "0000000000000000000000000000000000000000000000000000";
  # NOTE: This hash is **not** identical to the `nix-prefetch-url --unpack`
  # output, because moving the font files to `$out/share/fonts/truetype` also
  # affects the hash.

  postFetch = let
    basename = baseNameOf url;
  in ''
    renamed="$TMPDIR/${basename}"
    mv "$downloadedFile" "$renamed"
    unpackFile "$renamed"
    install -m444 -D -t $out/share/fonts/truetype *.ttf
  '';

  meta = with lib; {
    homepage = "https://github.com/NNBnh/bmono";
    downloadPage = "https://github.com/NNBnh/bmono/releases";
    description = "Mono font that SuperB ";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
