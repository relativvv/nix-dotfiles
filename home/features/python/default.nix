{ pkgs
, ...
}: {

  home.packages = [
    (pkgs.python313.withPackages (ppkgs: []))
    pkgs.pipenv
    pkgs.virtualenv
  ];
}
