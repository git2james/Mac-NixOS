{ ... }:

{
  system.defaults = {

    # Finder
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
      NewWindowTarget = "Home";
      ShowHardDrivesOnDesktop = true;
      ShowMountedServersOnDesktop = true;
      ShowRemovableMediaOnDesktop = true;
      _FXSortFoldersFirst = true;
    };

    # Spaces / Mission Control
    spaces.spans-displays = false;

    # Dock
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.1;
      expose-animation-duration = 0.1;
      tilesize = 48;
      launchanim = false;
      showhidden = false;
      show-recents = true;
      show-process-indicators = true;
      orientation = "bottom";
      mru-spaces = true;
      expose-group-apps = true;

      wvous-br-corner = 10;

      persistent-apps = [
        "/Applications/Microsoft Teams.app"
        "/Applications/Microsoft Outlook.app"
        "/Applications/Microsoft Excel.app"
        "/Applications/Microsoft Word.app"
        "/System/Applications/Utilities/Terminal.app"
      ];
      persistent-others = [
        "/Applications"
      ];
    };

    # Trackpad
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      Dragging = true;
      TrackpadMomentumScroll = true;
      TrackpadThreeFingerDrag = false;
    };

    # Global UI Behaviour
    NSGlobalDomain = {
      NSAutomaticWindowAnimationsEnabled = false;
      NSWindowResizeTime = 0.1;

      AppleInterfaceStyleSwitchesAutomatically = false;
      AppleTemperatureUnit = "Celsius";
      AppleShowScrollBars = "Automatic";

      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      "com.apple.sound.beep.feedback" = 1;
      "com.apple.sound.beep.volume" = 0.5;

      "com.apple.trackpad.scaling" = 2.5;

      # keyboard repeat settings
      KeyRepeat = 2;
      InitialKeyRepeat = 15;

      NSWindowShouldDragOnGesture = true;
    };

    CustomUserPreferences = {

      NSGlobalDomain = {
        AppleICUForce12HourTime = 1;
      };

      # Finder deeper behaviour
      "com.apple.finder" = {
        FXPreferredGroupBy = "Kind";
        WarnOnEmptyTrash = false;

        # List view settings
#        StandardViewSettings = {
#          ListViewSettings = {
#            calculateAllSizes = 1;
#          };
#        };
      };

      # Screenshots
      "com.apple.screencapture" = {
        location = "~/Downloads/Screenshots";
        type = "png";
      };

      # Desktop Services
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      # Screensaver Security
      "com.apple.screensaver" = {
        askForPassword = 1;
        askForPasswordDelay = 5;
      };

      "com.apple.AppleMultitouchTrackpad" = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      "com.apple.menuextra.clock" = {
        ShowAMPM = true;
        ShowDate = 1;
        ShowDayOfWeek = true;
        Use24HourTime = false;
      };
    };
  };

  system.activationScripts.postUserActivation.text = ''
    # Apply changes to macOS defaults
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}
