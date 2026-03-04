{ ... }:

{
  system.defaults = {

    # Finder
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      _FXShowPosixPathInTitle = true;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    # Spaces / Mission Control
    spaces.spans-displays = false;

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

    # Global UI Behaviour
    NSGlobalDomain = {
      NSAutomaticWindowAnimationsEnabled = false;
      NSWindowResizeTime = 0.1;

      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleTemperatureUnit = "Celsius";
      AppleShowScrollBars = "Automatic";

      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      "com.apple.sound.beep.feedback" = 1;
      "com.apple.sound.beep.volume" = 0.6;
      NSWindowShouldDragOnGesture = true;
    };

    # Screenshots
    CustomUserPreferences."com.apple.screencapture" = {
      location = "~/Downloads/Screenshots";
      type = "png";
    };

    # Desktop Services
    CustomUserPreferences."com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };

    # Screensaver Security
    CustomUserPreferences."com.apple.screensaver" = {
      askForPassword = 1;
      askForPasswordDelay = 5;
    };
  };

  # Ensure screenshot directory exists
  system.activationScripts.createScreenshotFolder.text = ''
    mkdir -p "$HOME/Downloads/Screenshots"
  '';
}
