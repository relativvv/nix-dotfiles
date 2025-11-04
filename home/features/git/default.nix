{ pkgs, ... }: {

  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;
    package = pkgs.git;
    lfs = {
      enable = true;
    };

    signing.key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmGYS24V9S1EASwGrM1+00ojVNPSKrZwwpalRmdwWGh7Zj8yLsHHavrMCILMKPH8ee0k06IK5aJRUanBKgpxFXwLCWMoWLOSMMsyVb6Zu8+awP+2xwuTbtXe1YP3TnYFjlMbFglJrUeKETZKuWAINGXZu8RoRcCyBky4MmZy0PVl435OGLMi9dWD3Eu7leZw3Q3p5+nRXlvWAdkER6/aOM+9SR2u9Mqumy+8gdLcxM1+BiBdcd5+1fwj9XdoNsCnMESB6i/Wqf66RISk6MsyEI4pVLonEK5rvUH+mP+DEixWLcMHr5PTSJ1Nf8V1AqCq24szZU1cSDE6LEyKhVgNqQUmQTuyfmUiHfKnqFsQOCy8e/+QfbalQZ8Wd5+O7kX2sMw+SmTpyh7jhOCvYatS3tFmFlDORQ8AuN8pBXcpWi6US+TMQfy2aq9ktSv5OzqR0K92bgSvEcRXdSFM+1AfZGlq0+NJ9c46xiUnBLVTg/YJ04wLu+ZDyXZKVUrXzRu68=";
    signing.signByDefault = true;

    settings = {
      user.email = "r.schulte@shopware.com";
      user.name = "Robin Schulte";

      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      push.default = "simple";
      fetch.prune = true;

      gpg.format = "ssh";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      git = {
        overrideGpg = true;
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };

  home.file = {
    ".ssh/allowed_signers".text = "r.schulte@shopware.com namespaces=\"git\" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmGYS24V9S1EASwGrM1+00ojVNPSKrZwwpalRmdwWGh7Zj8yLsHHavrMCILMKPH8ee0k06IK5aJRUanBKgpxFXwLCWMoWLOSMMsyVb6Zu8+awP+2xwuTbtXe1YP3TnYFjlMbFglJrUeKETZKuWAINGXZu8RoRcCyBky4MmZy0PVl435OGLMi9dWD3Eu7leZw3Q3p5+nRXlvWAdkER6/aOM+9SR2u9Mqumy+8gdLcxM1+BiBdcd5+1fwj9XdoNsCnMESB6i/Wqf66RISk6MsyEI4pVLonEK5rvUH+mP+DEixWLcMHr5PTSJ1Nf8V1AqCq24szZU1cSDE6LEyKhVgNqQUmQTuyfmUiHfKnqFsQOCy8e/+QfbalQZ8Wd5+O7kX2sMw+SmTpyh7jhOCvYatS3tFmFlDORQ8AuN8pBXcpWi6US+TMQfy2aq9ktSv5OzqR0K92bgSvEcRXdSFM+1AfZGlq0+NJ9c46xiUnBLVTg/YJ04wLu+ZDyXZKVUrXzRu68=";
  };
}
