{ pkgs, config, ... }: {

  programs.go = {
    enable = true;
    package = pkgs.go_1_26;
    env.GOPATH = "/Users/R.Schulte/.go";
  };
}
