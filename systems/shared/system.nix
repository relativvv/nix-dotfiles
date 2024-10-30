{ pkgs
, remapKeys
, ...
}: {
  system.defaults.dock = {
    autohide = false;

    expose-animation-duration = 0.2;
    tilesize = 48;
    launchanim = false;
    static-only = false;
    showhidden = true;
    show-recents = false;
    show-process-indicators = true;
    orientation = "bottom";
    mru-spaces = false;
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.keyboard = {
    enableKeyMapping = true;
    swapLeftCommandAndLeftAlt = remapKeys;
    
    # use https://hidutil-generator.netlify.app/ and convert hex to decimal
    #userKeyMapping = [
    #  {
    #    HIDKeyboardModifierMappingSrc = 30064771300;
    #    HIDKeyboardModifierMappingDst = 30064771302;
    #  }
    #];
  };
}
