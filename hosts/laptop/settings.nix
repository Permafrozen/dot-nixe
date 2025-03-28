rec {
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
  wallpaper = "skull.png"; # ../assets/wallpaper/
  scheme = "da-one-black"; # base16-schemes Package
  opacity = "0.5";
  font-size = "14";
  cursor = "McMojave"; # Bibata-Modern-Classic, McMojave
  hyprcursor = "McMojave-Hypr";

  # Setup Specific Hyprland Config
  hyprConfig = ''
    monitor= eDP-1, 1920x1080@60, 0x0, 1
    monitor=HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1
  '';

  # variable apps
  browser = "zen"; # firefox, floorp, ungoogle-chromium, librewolf, zen
  terminal = "ghostty"; # kitty, foot, ghostty
  shell = "fish"; # zsh, fish, bash

  pkgs = [
    "virt-manager"
    "xdg-user-dirs"
    "steam"
    "mpd"
    "ncmpcpp"
    "kernel"
    "pipewire"
    "hyprland"
    "starship"
    "stylix"
    "swww"
    "sddm" # "greetd"
    "libreoffice"
    "yazi"
    "btop"
    "obsidian"
    "quickemu"
    "discord"
    "git"
    "syncthing"
    "ani-cli"
    "jetbrains"
    "fastfetch"
    "nh"
    "hyprlock"
    "kanata"
    "cliphist"
    "distrobox"
    "planify"
    "bluetooth"
    "ags"
    "zathura"
    "tealdeer"
    "walker"
    "docker"
    "zed"
    "element"
    "wireshark"
    "${terminal}" # BROWSER
    "${browser}" # TERMINAL
    "${shell}" # SHELL
  ];
}
