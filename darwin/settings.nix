{ ... }:

{
  system = {
    stateVersion = 5;
    keyboard = {
      enableKeyMapping      = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      dock = {
        autohide                = true;
        mru-spaces              = false;
        showhidden              = false;
        show-recents            = false;
        minimize-to-application = true;
        orientation             = "left";
        tilesize                = 40;
        persistent-apps = [
          "/Applications/Dia.app/"
          "/Applications/Zed.app/"
          "/Applications/Obsidian.app/"
          "/Applications/Kiro.app/"
          "/Applications/Zed.app/"
          "/Applications/Docker.app/"
          "/Applications/Proton\ Pass.app/"
          "/Applications/Microsoft\ Teams.app/"
          "/Applications/Microsoft\ Outlook.app/"
        ];
      };
      finder = {
        _FXShowPosixPathInTitle = true;     # show full path in top bar
        _FXSortFoldersFirst     = true;     # Sort folders first in finder
        AppleShowAllExtensions  = true;     # Always show file extensions
        AppleShowAllFiles       = true;     # Always show hidden files
        ShowPathbar             = true;     # Show a path bar
        ShowStatusBar           = true;     # Show bottom disk stats bar
        CreateDesktop           = false;    # Should hide desktop icons I think
        FXPreferredViewStyle    = "clmv";   # column view in finder
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;  # disable click on wallpaper thing
        StandardHideDesktopIcons         = true;   # hide desktop icons
        StandardHideWidgets              = true;   # hide desktop widgets
      };
      trackpad = {
        Clicking           = true;                 # enable tap to click
        TrackpadRightClick = true;                 # enable right click on bottom right of trackpad
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      screensaver = {
        askForPassword      = true;
        askForPasswordDelay = 5;
      };
      loginwindow = {
        GuestEnabled    = false;
        LoginwindowText = "Leave me be.";
      };
      menuExtraClock.Show24Hour = true;
      NSGlobalDomain = {
        _HIHideMenuBar                                   = true;
        AppleShowAllFiles                                = true;  # Theoretically overlaps with above option
        AppleShowAllExtensions                           = true;  # same.
        AppleInterfaceStyle                              = "Dark";
        "com.apple.mouse.tapBehavior"                    = 1;
        "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
        "com.apple.trackpad.enableSecondaryClick"        = true;
      };
      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          # Disable creating .DS_Store files in network an USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores     = true;
        };
        # "~/Library/Preferences/ByHost/com.apple.controlcenter".BatteryShowPercentage = true;  # Show battery percentage
        "com.apple.AdLib".allowApplePersonalizedAdvertising                          = false; # Privacy
      };
    };
    startup.chime = false;
  };
}
