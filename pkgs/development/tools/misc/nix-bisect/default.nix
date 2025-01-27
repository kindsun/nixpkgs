{ lib
, fetchFromGitHub
, python3
}:

let
  pname = "nix-bisect";
  version = "0.4.1";
in
python3.pkgs.buildPythonApplication {
  inherit pname version;
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "timokau";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-01vj35mMakqKi5zbMIPQ+R8xdkOWbzpnigd3/SU+svw=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    appdirs
    numpy
    pexpect
  ];

  doCheck = false;

  meta = with lib; {
    description = "Bisect nix builds";
    homepage = "https://github.com/timokau/nix-bisect";
    license = licenses.mit;
    maintainers = with maintainers; [ hexa ];
  };
}
