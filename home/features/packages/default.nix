{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${system}.devenv
    cachix

    nixpkgs-fmt

    _1password
    jq
    gnused
    ripgrep
    unixtools.watch
    htop
    coreutils
    wget

    docker-client
    docker-buildx
    gh
  ];
}

