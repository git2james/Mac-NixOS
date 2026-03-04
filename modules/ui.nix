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

      # Correct pointer speed control
      "com.apple.trackpad.scaling" = 3.0;

      NSWindowShouldDragOnGesture = true;
    };

    CustomUserPreferences = {

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

      # Internal MacBook trackpad
      "com.apple.AppleMultitouchTrackpad" = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      # Magic Trackpad / Bluetooth trackpad
      "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
        Clicking = true;
        TrackpadRightClick = true;
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

  # Force pointer speed because macOS reads the ByHost domain
  system.activationScripts.trackpadSpeed.text = ''
    echo "Setting trackpad speed..."

    /usr/bin/defaults write -g com.apple.trackpad.scaling -float 3

    for file in ~/Library/Preferences/ByHost/.GlobalPreferences.*.plist; do
      /usr/bin/defaults write "$file" com.apple.trackpad.scaling -float 3 || true
    done

    /usr/bin/killall cfprefsd || true
  '';

}
