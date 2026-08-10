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
      {
        name = "shopware/tap";
        trusted = true;
      }
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
      "trufflehog"
      "gitleaks"
      "git-filter-repo"
      "awscli"
      "mole"
      "ffmpeg"
      "rtk"
    ];

    casks = [
      "hammerspoon"
      "orbstack"
      "insomnia"
      "minecraft"
      "lm-studio"
      "ghostty"
      "yaak"
      "zen"
      "spotify"
      "cursor"
      "figma"
      "chatgpt"
      "miro"
      "proton-mail"
      "whatsapp"
      "slack"
      "discord"
      "visual-studio-code"
      "claude-code"
      "ngrok"
      "zed"
      "codex"
      "shopware-cli"
      "obsidian"
      "obs"
      "openusage"
      "blender"
    ];
  };
}
