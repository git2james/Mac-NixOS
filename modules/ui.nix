{ ... }:

{
  system.defaults = {

    # Finder
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      _FXShowPosixPathInTitle = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
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
      showhidden = true;
      show-recents = false;
      show-process-indicators = true;
      orientation = "bottom";
      mru-spaces = false;
      expose-group-apps = true;

      # bottom-right corner: put display to sleep
      wvous-br-corner = 10;
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

      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleTemperatureUnit = "Celsius";
      AppleShowScrollBars = "Automatic";

      AppleICUForce24HourTime = false;

      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      "com.apple.sound.beep.feedback" = 1;
      "com.apple.sound.beep.volume" = 0.5;

      # Pointer speed
      "com.apple.trackpad.scaling" = 3.0;

      NSWindowShouldDragOnGesture = true;
    };

    CustomUserPreferences = {

      # Global preferences not supported directly by nix-darwin
      NSGlobalDomain = {
        "com.apple.mouse.scaling" = 3.0;
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

      # Trackpad (internal)
      "com.apple.AppleMultitouchTrackpad" = {
        Clicking = true;
        TrackpadRightClick = true;
        "com.apple.trackpad.scaling" = 3.0;
      };

      # Trackpad (Bluetooth / Magic Trackpad)
      "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
        Clicking = true;
        TrackpadRightClick = true;
        "com.apple.trackpad.scaling" = 3.0;
      };

      # Menu bar clock
      "com.apple.menuextra.clock" = {
        ShowAMPM = true;
        ShowDate = 1;
        ShowDayOfWeek = true;
        Use24HourTime = false;
      };
    };
  };
}
