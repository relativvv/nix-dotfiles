{
  pkgs,
  ...
}: {
  services.aerospace = {
    enable = false;
    package = pkgs.aerospace;

    settings= {
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      on-focus-changed = [
        "move-mouse window-lazy-center"
      ];

      automatically-unhide-macos-hidden-apps = false;

      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 10;
        outer.bottom = 10;
        outer.top = 10;
        outer.right = 10;
      };

      on-window-detected = [
        {
          "if".app-name-regex-substring = "discord";
          run = "layout floating";
        }
        {
          "if".app-name-regex-substring = "whatsapp";
          run = "layout floating";
        }
        {
          "if".app-name-regex-substring = "spotify";
          run = "layout floating";
        }
        {
          "if".app-name-regex-substring = "chatgpt";
          run = "layout floating";
        }
        {
          "if".app-name-regex-substring = "slack";
          run = "layout floating";
        }
        {
          "if".app-name-regex-substring = "notion";
          run = "layout floating";
        }
        {
          "if".app-name-regex-substring = "craft";
          run = "layout floating";
        }
      ];
 
      workspace-to-monitor-force-assignment = {
        "0" = "built-in";
      };
 
      key-mapping.preset = "qwerty";
      mode.main.binding = {

        alt-ctrl-shift-f = "fullscreen";
        alt-ctrl-f = "layout floating tiling";
        alt-ctrl-t = "layout tiling";

        alt-shift-left = "join-with left";
        alt-shift-down = "join-with down";
        alt-shift-up = "join-with up";
        alt-shift-right = "join-with right";

        alt-ctrl-h = "focus left";
        alt-ctrl-j = "focus down";
        alt-ctrl-k = "focus up";
        alt-ctrl-l = "focus right";
      
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-ctrl-f1 = "workspace 0";
        alt-ctrl-1 = "workspace 1";
        alt-ctrl-2 = "workspace 2";
        alt-ctrl-3 = "workspace 3";
        alt-ctrl-4 = "workspace 4";
        alt-ctrl-5 = "workspace 5";
        alt-ctrl-6 = "workspace 6";

        alt-shift-p = "workspace --wrap-around prev";
        alt-shift-n = "workspace --wrap-around next";

        alt-shift-f1 = ["move-node-to-workspace 0" "workspace 0"];
        alt-shift-1 = ["move-node-to-workspace 1" "workspace 1"];
        alt-shift-2 = ["move-node-to-workspace 2" "workspace 2"];
        alt-shift-3 = ["move-node-to-workspace 3" "workspace 3"];
        alt-shift-4 = ["move-node-to-workspace 4" "workspace 4"];
        alt-shift-5 = ["move-node-to-workspace 5" "workspace 5"];
        alt-shift-6 = ["move-node-to-workspace 6" "workspace 6"];

        alt-shift-cmd-right = "move-node-to-monitor right";
        alt-shift-cmd-left = "move-node-to-monitor left";

        alt-shift-r = "mode resize";
        alt-shift-y = "mode layout";

        alt-g = "exec-and-forget open -na ghostty";
      };

      mode.resize.binding = {
        left = "resize width +50";
        right = "resize width -50";
        up = "resize height +50";
        down = "resize height -50";
        esc = "mode main";
      };

      mode.layout.binding = {
        esc = "mode  main";
        enter = "mode main";
        r = "flatten-workspace-tree";
        alt-left = "join-with left";
        alt-right = "join-with right";
        alt-up = "join-with up";
        alt-down = "join-with down";
        alt-s = "layout v_accordion";
        alt-w = "layout h_accordion";
        alt-e = "layout tiles horizontal vertical";
      };
    };
  };

  services.jankyborders = {
    enable = true;
    inactive_color = "0xff494d64";
  };
}
