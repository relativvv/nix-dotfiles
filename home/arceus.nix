{ config
, pkgs
, lib
, flake
, ... }:

{
  imports = [
    flake.inputs.mac-app-util.homeManagerModules.default
    ./default.nix
  ];

  home.username = "R.Schulte";
  home.homeDirectory = lib.mkForce "/Users/R.Schulte";
}
