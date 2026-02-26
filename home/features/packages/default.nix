{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${pkgs.system}.devenv
    cachix

    nixpkgs-fmt

    _1password-cli
    jq
    gnused
    ripgrep
    unixtools.watch
    htop
    coreutils
    pigz
    wget
    mysql84
    cargo
    nmap
    nh

    terraform

    docker-client
    docker-buildx
    dive
    gh
    bun
  ];
}

