{ ... }:

{
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;

  system.defaults.CustomUserPreferences = {
    "com.apple.Terminal" = {
      "Default Window Settings" = "Clear Dark";
      "Startup Window Settings" = "Clear Dark";
    };
  };
}
