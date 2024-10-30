{ pkgs
, ...
}: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    brews = [
      "docker-credential-helper"
    ];

    casks = [
      "insomnia"
      "orbstack"
    ];
  };
}
