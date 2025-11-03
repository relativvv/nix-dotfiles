{ pkgs, ... }: {

  home.file = {
    ".config/ghostty/config".source = ./config;
    ".config/ghostty/themes/catppuccin-mocha".source = ./catppuccin-mocha;
  };

}
