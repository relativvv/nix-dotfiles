{ pkgs, flake, ... }:
let
  # Temporary pin: nixpkgs still ships bun 1.3.13, the 1.4.0 bump is stuck upstream
  # (NixOS/nixpkgs#556047). Remove this override once nixpkgs carries 1.4.0.
  bun_1_4 = pkgs.bun.overrideAttrs (finalAttrs: prevAttrs: {
    version = "1.4.0";
    # src comes from passthru.sources, which we override below.
    __intentionallyOverridingVersion = true;
    passthru = prevAttrs.passthru // {
      sources = prevAttrs.passthru.sources // {
        "aarch64-darwin" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v${finalAttrs.version}/bun-darwin-aarch64.zip";
          hash = "sha256-xmnpf2Fk4cluBwF0jbmN+ndJKQjL2DlMdVcTSnNd44E=";
        };
      };
    };
  });
in
{

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${pkgs.stdenv.hostPlatform.system}.devenv
    cachix

    nixfmt

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
    bun_1_4
  ];
}
