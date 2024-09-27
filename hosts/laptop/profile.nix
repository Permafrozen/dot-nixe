let
  getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
in {
  imports = [
    (getPath "pipewire")
    (getPath "hyprland")
    (getPath "kitty")
    (getPath "fish")
    (getPath "starship")
    (getPath "stylix")
    (getPath "swww")
    (getPath "ly")
  ];
}
