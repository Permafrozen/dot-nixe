{
  # system settings
  userName =      "matteo";             # foo@...
  hostName =      "nixos";              # ...@bar
  hostPreset =    "desktop";             # Name of the host config to use (this one is in /laptop)

  # local specifics
  timeZone =      "Europe/Vienna";      # system time
  kbLayout =      "de";                 # Be careful, some layouts are not supported, e.g. "at" for Austria
  locale =        "de_AT";              # I think this one explains itself
  searchRegion =  "AT";                 # Region for browsing purposes

  # git settings
  gitUser =       "Permafrozen";
  gitMail =       "m8tt8o@gmail.com";
  defaultBranch = "main";

  # theme
  wallpaper =     "space.png";          # background image, located in .../assets/wallpaper/ , also write the file ending!
  scheme =        "eris";               # Color Theme (Chose any from the base16-schemes Package)

  # hyprland
  rounding =      "10";                 # Corner rounding
  gaps =          "10";                 # Gaps between windows
  shadow =        "true";               # Wheater to enable window shadow
  opacity =       "0.7";                # background opacities for supported windows
  blur =          "7";                  # background blur for supported windows
  hyprConfig = ''
    monitor= ,preferred, auto, 1 
  '';

  # default apps
  browser =       "firefox";            # only firefox for now
  terminal =      "kitty";              # only kitty for now
}
