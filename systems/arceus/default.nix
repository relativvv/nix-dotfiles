{ pkgs
, home-manager
, flake
, lib
, config
, ...
}: {
  imports = [
    ../shared/brew.nix
    ../shared/system.nix
    ../shared/fonts.nix
  ];

  system.stateVersion = 5;

  users.users.robin = {
    home = "/Users/robin";
    shell = "${pkgs.zsh}/bin/zsh";
  };

  home-manager.users.robin = {
    imports = [
      ../../home/arceus.nix
    ];
  };


  nix.gc = {
    automatic = true;
    options = "--delete-older-than 2d";
    interval = {
      Hour = 5;
      Minute = 0;
    };
  };

  environment.systemPackages = with pkgs; [
    raycast
  ];

  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  environment.shells = [ "${pkgs.zsh}/bin/zsh" ];

  documentation.enable = false;
  documentation.man.enable = false;

  time.timeZone = "Europe/Berlin";

  # Nix config from https://github.com/DeterminateSystems/nix-installer

  nix = {
    settings.trusted-users = [ "root" "robin" ];
  };

}
