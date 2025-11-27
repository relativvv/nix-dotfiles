{ pkgs
, ...
}: {

  programs.tmux = {
    enable = true;
    shell = "/etc/profiles/per-user/R.Schulte/bin/fish";

    # Basic tmux settings
    prefix = "C-b";
    baseIndex = 1;
    escapeTime = 0; # From tmux-sensible
    keyMode = "vi"; # From tmux-sensible

    # Plugins
    plugins = with pkgs.tmuxPlugins; [
      sensible
      cpu
      catppuccin
      tmux-fzf
      tmux-sessionx
      {
        plugin = tmux-floax;
        extraConfig = ''
          set -g @floax-width '80%'
          set -g @floax-height '80%'
          set -g @floax-border-color 'magenta'
          set -g @floax-text-color 'blue'
          set -g @floax-bind 'p'
          set -g @floax-change-path 'true'
        '';
      }
    ];

    # Additional configuration
    extraConfig = ''
      # Default command to run fish as login shell
      set -g default-command "/etc/profiles/per-user/R.Schulte/bin/fish"

      # Pane border styles
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'

      # Status position
      set -g status-position top

      # Clipboard
      set -g set-clipboard on

      # SessionX configuration
      set -g @sessionx-bind-zo-new-window 'ctrl-y'
      set -g @sessionx-auto-accept 'off'
      set -g @sessionx-bind 'o'
      set -g @sessionx-window-height '85%'
      set -g @sessionx-window-width '75%'
      set -g @sessionx-zoxide-mode 'on'
      set -g @sessionx-custom-paths-subdirectories 'false'
      set -g @sessionx-filter-current 'false'

      # Catppuccin theme configuration
      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator " "
      set -g @catppuccin_window_middle_separator " █"å
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
      set -g @catppuccin_status_modules_right "directory cpu application"
      set -g @catppuccin_status_modules_left "session"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator " "
      set -g @catppuccin_status_right_separator_inverse "no"
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_directory_text "#{b:pane_current_path}"

      # Status right with CPU and uptime
      set -g status-right "#{E:@catppuccin_status_application}"
      set -agF status-right "#{E:@catppuccin_status_cpu}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"
    '';
  };

}
