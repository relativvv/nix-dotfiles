{ pkgs
, ...
}: {
  # Python Configuration
  # Currently using Python 3.14
  # Available Python versions in nixpkgs follow the python3XX naming pattern.
  #
  # To upgrade to a newer Python version:
  # 1. Check nixpkgs for the latest available version.
  # 2. Update the version number below.
  # 3. Test your applications for compatibility
  # 4. Update any hardcoded version references in scripts/shell configs
  home.packages = [
    (pkgs.python314.withPackages (ppkgs: []))
    pkgs.pipenv
    pkgs.virtualenv
    pkgs.uv
  ];
}
