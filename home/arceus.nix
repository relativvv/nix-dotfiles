{ config
, pkgs
, lib
, flake
, ... }:

{
  imports = [
    ./default.nix
    ./features/hammerspoon
  ];

  home.username = "R.Schulte";
  home.homeDirectory = "/Users/R.Schulte";
}
