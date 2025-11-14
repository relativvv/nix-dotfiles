{ pkgs, ... }: {

  home.packages = with pkgs; [
    jujutsu
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Robin Schulte";
        email = "r.schulte@shopware.com";
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = "~/.ssh/id_rsa.pub";
      };
      signing.backends.ssh.allowed-signers = "~/.ssh/allowed_signers";
    };
  };
}