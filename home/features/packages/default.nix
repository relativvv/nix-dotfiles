{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${system}.devenv
    cachix

    nixpkgs-fmt
    sops

    _1password-cli
    jq
    gnused
    ripgrep
    unixtools.watch
    htop
    coreutils
    pigz
    ssm-session-manager-plugin
    wget
    wireguard-tools
    mysql80
    kubectl
    kubectx
    kubernetes-helm
    kubent

    terraform

    act
    ory

    istioctl
    docker-client
    docker-buildx
    dive
    bun
    k9s
    gh
    k6
    awscli2
    eksctl
    cilium-cli

    kind
  ];
}

