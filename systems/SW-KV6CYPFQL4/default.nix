{ pkgs
, home-manager
, flake
, lib
, config
, ...
}: {
  imports = [
    ../shared/aerospace.nix
    ../shared/brew.nix
    ../shared/system.nix
    ../shared/fonts.nix
  ];

  system.stateVersion = 5;
  system.primaryUser = "R.Schulte";

  ids.gids.nixbuild = 30000;

  users.users."R.Schulte" = {
    home = "/Users/R.Schulte";
    shell = "${pkgs.fish}/bin/fish";
  };

  home-manager.users."R.Schulte" = {
    imports = [
      ../../home/SW-KV6CYPFQL4.nix
    ];
  };

  environment.systemPackages = with pkgs; [
    raycast
  ];

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  environment.shells = [ "${pkgs.fish}/bin/fish" ];

  documentation.enable = false;
  documentation.man.enable = true;

  time.timeZone = "Europe/Berlin";
  
  nix.enable = false;
}
