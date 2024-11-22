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
      "argocd"
      "eks-node-viewer"
      "azure-cli"
    ];

    casks = [
      "orbstack"
      "hammerspoon"
    ];
  };
}
