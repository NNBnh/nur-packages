{ lib, stdenv, fetchzip }:

stdenv.mkDerivation rec {
  version = "1.2-11.2.2";
  name = "bmono-${version}";
  src = fetchzip {
    url = "https://github.com/NNBnh/bmono/releases/download/v${version}/bmono-ttf.zip";
    sha256 = "0c9blhj8rmpmwh7vp2i8f4w8lmbrvk3bd5davh7wqxdd72fmc5gq";
  };
  buildCommand = ''
    install --target $out/share/fonts/truetype/ -D $src/ttf/*.ttf 
  '';

  meta = with lib; {
    homepage = "https://github.com/NNBnh/bmono";
    downloadPage = "https://github.com/NNBnh/bmono/releases";
    description = "Mono font that SuperB ";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
