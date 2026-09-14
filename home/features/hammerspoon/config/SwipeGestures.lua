Swipe = hs.loadSpoon("Swipe")

-- Requires "Enable IPC" in OmniWM's status bar menu, otherwise omniwmctl
-- cannot reach the running instance.
local OMNIWMCTL = "/run/current-system/sw/bin/omniwmctl"

function omniwmExec(cmd)
  os.execute("nohup " .. OMNIWMCTL .. " " .. cmd .. " &", true)
end

-- use four finger swipe to switch workspace
local current_id, threshold
Swipe:start(4, function(direction, distance, id)
  if id == current_id then
      if distance > threshold then
          threshold = math.huge -- only trigger once per swipe

          -- use "natural" scrolling
          if direction == "left" then
            omniwmExec("command switch-workspace prev")
          elseif direction == "right" then
            omniwmExec("command switch-workspace next")
          end
      end
  else
      current_id = id
      threshold = 0.01 -- swipe distance > 20% of trackpad
  end
end)
