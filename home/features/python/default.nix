{ pkgs
, ...
}: {
  # Python Configuration
  # Currently using Python 3.13 (latest stable version)
  # Available Python versions in nixpkgs: python310, python311, python312, python313
  #
  # To upgrade to a newer Python version when available:
  # 1. Check nixpkgs for the latest version (e.g., python314 when released)
  # 2. Update the version number below (e.g., python314.withPackages)
  # 3. Test your applications for compatibility
  # 4. Update any hardcoded version references in scripts/shell configs
  #
  # Example upgrade to Python 3.14 (when available):
  # (pkgs.python314.withPackages (ppkgs: []))
  #
  # Note: Python versions in nixpkgs follow the pattern python3XX
  # where XX is the minor version (e.g., python313 = Python 3.13)

  home.packages = [
    (pkgs.python314.withPackages (ppkgs: []))
    pkgs.pipenv
    pkgs.virtualenv
    pkgs.uv
  ];
}
