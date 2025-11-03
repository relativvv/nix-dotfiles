{ pkgs, ... }: {

  home.packages = with pkgs; [
    volta
  ];

  # Volta configuration is already set up in shell/default.nix
  # The VOLTA_HOME and PATH additions are handled there

}
