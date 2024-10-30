{ config
, pkgs
, lib
, flake
, ... }:

{
  imports = [
    flake.inputs.mac-app-util.homeManagerModules.default
    ./default.nix
    ./features/darwin
  ];

  home.username = "robin";
  home.homeDirectory = lib.mkForce "/Users/robin";
}
