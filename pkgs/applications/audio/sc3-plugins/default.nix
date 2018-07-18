{ stdenv,fetchFromGitHub, cmake, pkgconfig, supercollider, fftw, libsndfile }:

stdenv.mkDerivation rec {
	name = "sc3-plugins-${version}";
  version = "3.9.1";

	src = fetchFromGitHub {
		sha256="0d5pvmzbmgm8vxmzi6z2wchl3345jshnjfn2czf1hyiq08kvbqqi";
		rev = "Version-${version}";
    repo = "sc3-plugins";
    owner = "supercollider";
		fetchSubmodules = true;
	};

	buildInputs = [ cmake supercollider fftw libsndfile ];
	cmakeFlags = [ "-DSUPERNOVA=OFF" "-DSC_PATH=${supercollider}/include/SuperCollider" "-DFFTW3F_LIBRARY=${fftw}/lib/"];

  meta = with stdenv.lib; {
    description = "Extension plugins for the SuperCollider3 audio synthesis server";
    homepage = https://github.com/supercollider/sc3-plugins; 
    license = licenses.lgpl2;
    platforms = platforms.linux;
    maintainers = with maintainers; [ bfortz ];
  };
}
