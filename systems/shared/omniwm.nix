{
  pkgs,
  ...
}:

# OmniWM keeps its own settings at ~/.config/omniwm/settings.toml. The file is
# deliberately NOT managed by Nix: the schema is strict (every hotkey action has
# to appear exactly once) and a settings file living in the read-only Nix store
# makes the built-in Settings window unable to save. Configure via the GUI for
# now; once the setup has settled the file can be moved into this repo.
#
# Manual steps that cannot be declared:
#   - System Settings > Desktop & Dock > Mission Control:
#     "Displays have separate Spaces" ON, then log out and back in.
#   - Grant Accessibility and Input Monitoring on first launch.
#   - Status bar menu > "Enable IPC" if omniwmctl should work
#     (required by the Hammerspoon swipe gestures).
let
  omniwm = pkgs.callPackage ../../packages/omniwm.nix { };
in
{
  environment.systemPackages = [ omniwm ];

  launchd.user.agents.omniwm = {
    command = "${omniwm}/Applications/OmniWM.app/Contents/MacOS/OmniWM";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
    };
  };
}
