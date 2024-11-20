{
  # system settings
  userName = "matteo";
  hostName = "nixos";
  hostPreset = "laptop";

  # local specifics
  timeZone = "Europe/Vienna";
  kbLayout = "de"; # some layouts are not supported, e.g. "at" for Austria
  locale = "de_AT";
  searchRegion = "AT";

  # git settings
  gitUser = "Permafrozen";
  gitMail = "permafrozen@disroot.org";
  defaultBranch = "main";

  # theme
  wallpaper =
    "city.png"; # background image, located in .../assets/wallpaper/ , also write the file ending!
  scheme =
    "ayu-mirage"; # Color Theme (Chose any from the base16-schemes Package)

  # hyprland
  rounding = "10";
  gaps = "10";
  shadow = "false";
  opacity = "1";

  # Setup Specific Hyprland Config
  hyprConfig = ''
    monitor= eDP-1, 1920x1080@60, 0x0, 1
    monitor=HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1
  '';

  # default apps
  browser = "firefox"; # only firefox for now
  terminal = "foot"; # kitty, foot
}
