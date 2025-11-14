# This file contains the MacOS Homebrew configurations for the system, including taps, brews and casks.
{ pkgs
, ...
}: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "aws/tap"
    ];

    brews = [
      "docker-credential-helper"
      "yt-dlp"
      "lazygit"
      "mise"
    ];

    casks = [
      "orbstack"
      "insomnia"
      "capcut"
      "minecraft"
      "lm-studio"
      "ghostty"
      "hammerspoon"
      #"microsoft-office"
      #"microsoft-teams"
      #"craft"
      #"jetbrains-toolbox"
      #"chatgpt"
      #"miro"
      #"proton-mail"
      #"whatsapp"
      #"slack"
      #"discord"
    ];
  };
}
