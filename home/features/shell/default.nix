{ pkgs, ... }: {

  home.packages = with pkgs; [
    fzf
    fd
    bat
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      # Overwrite default ctrl+r history-pager
      fzf_configure_bindings
    '';

    # workaround for fixing the path order: https://github.com/LnL7/nix-darwin/issues/122
    shellInit = ''
      eval $(ssh-agent -c)
      ssh-add > /dev/null

      for elt in $PATH
        if not contains -- $elt $oldPath /usr/local/bin /usr/bin /bin /usr/sbin /sbin
          set -ag fish_user_paths $elt
        end
      end
      set -el oldPath

      # Set locale
      set -gx LANG "en_US.UTF-8"

      # Homebrew config
      set -gx HOMEBREW_PREFIX "/opt/homebrew";
      set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
      set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
      ! set -q PATH; and set PATH \'\'; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
      ! set -q MANPATH; and set MANPATH \'\'; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
      ! set -q INFOPATH; and set INFOPATH \'\'; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

      # Local Binaries
      fish_add_path $HOME/.local/bin

      # Volta
      set -gx VOLTA_HOME $HOME/.volta
      fish_add_path $VOLTA_HOME/bin

      # Go Binaries
      fish_add_path $GOPATH/bin

      # XDG Config Home
      set -gx XDG_CONFIG_HOME $HOME/.config

      # Mise
      mise activate fish | source
    '';

    plugins = [
      { name = "fzf"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "async-prompt"; src = pkgs.fishPlugins.async-prompt; }
    ];

    functions = {
      c = ''
        set DIR (zoxide query -l | fzf)
        z $DIR
      '';
      t = ''
        tmux attach -t "$(tmux ls -F '#{session_name}:#{window_name}' | fzf)"
      '';
      awsx = ''
        if test -z $AWSX_PROFILES
            set -gx AWS_PROFILES (aws configure list-profiles | string split0)
        end

        set -gx AWS_PROFILE (echo $AWS_PROFILES | fzf)

        echo "Using profile: $AWS_PROFILE"
        aws sts get-caller-identity &> /dev/null
        if test $status != 0
            echo "AWS SSO Session expired. Logging in..."
            aws sso login
        else
            echo "Found valid SSO session, using it!"
        end
      '';
      ssm-headscale = ''
        set HEADSCALE_INSTANCE_ID (aws ec2 describe-instances --filters "Name=tag:Name,Values=headscale" --query 'Reservations[].Instances[].InstanceId' --output text)
        aws ssm start-session --document-name AWS-StartInteractiveCommand  --parameters command="bash -l" --target $HEADSCALE_INSTANCE_ID
      '';
    };
  };


  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  home.file = { 
    ".config/starship.toml".source = ./starship.toml;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  home.shellAliases = {
    "cat" = "bat -pp";
    "python" = "python3";
    "pip" = "pip3";
    "ls" = "eza --icons --group --group-directories-first";
    "ll" = "eza --icons --group --group-directories-first -l";
    "tree" = "eza --icons --group --group-directories-first -T";
    "hms" = "git -C $HOME/.config/nix-dotfiles add . && sudo darwin-rebuild switch --flake $HOME/.config/nix-dotfiles/ --show-trace";
  };
}
