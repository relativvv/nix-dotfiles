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
      "lazydocker"
      "mise"
      "rust"
      "ollama"
      "yq"
      "jq"
      "fd"
    ];

    casks = [
      "hammerspoon"
      "orbstack"
      "insomnia"
      "minecraft"
      "lm-studio"
      "ghostty"
      "yaak"
      "lm-studio"
      "zen"
      "spotify"
      "cursor"
      "figma"
      "craft"
      "chatgpt"
      "miro"
      "proton-mail"
      "whatsapp"
      "slack"
      "discord"
      "visual-studio-code"
    ];
  };
}
