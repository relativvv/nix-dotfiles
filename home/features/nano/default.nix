{ pkgs, ... }: {

  home.packages = with pkgs; [
    nano
  ];

    home.file = {
    ".config/nano/nanorc".source = ./nanorc;
  };
}