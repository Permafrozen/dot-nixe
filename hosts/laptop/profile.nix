{ settings, ... }:
  let
    getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
  in 
{
  imports = [
    # Normal Apps
    (getPath "pipewire")
    (getPath "hyprland")
    (getPath "fish")
    (getPath "starship")
    (getPath "stylix")
    (getPath "swww")
    (getPath "ly")
    (getPath "lazygit")

    # Variable Apps
    (getPath "${settings.terminal}")  # BROWSER
    (getPath "${settings.browser}")   # TERMINAL
  ];
}
