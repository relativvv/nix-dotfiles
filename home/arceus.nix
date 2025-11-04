{ config
, pkgs
, lib
, flake
, ... }:

{
  imports = [
    ./default.nix
  ];

  home.username = "R.Schulte";
  home.homeDirectory = "/Users/R.Schulte";
}
