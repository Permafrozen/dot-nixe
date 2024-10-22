{
  # system settings
  userName =      "homelab";                       # foo@...
  hostName =      "nixos";                        # ...@bar
  hostPreset =    "homelab";                       # Name of the host config to use (this one is in /laptop)

  # local specifics
  timeZone =      "Europe/Vienna";                # system time
  kbLayout =      "de";                           # Be careful, some layouts are not supported, e.g. "at" for Austria
  locale =        "de_AT";                        # I think this one explains itself
  searchRegion =  "AT";                           # Region for browsing purposes

  # git settings
  gitUser =       "Homelab";
  gitMail =       "none";
  defaultBranch = "main";

  # theme
  wallpaper =     "foggy_mountains.png";          # background image, located in .../assets/wallpaper/ , also write the file ending!
  scheme =        "catppuccin-frappe";            # Color Theme (Chose any from the base16-schemes Package)

}
