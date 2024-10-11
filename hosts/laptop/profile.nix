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
    (getPath "vscode")
    (getPath "libreoffice")
    (getPath "yazi")
    (getPath "bottom")
    (getPath "obsidian")
    (getPath "quickemu")
    (getPath "vesktop")
    (getPath "git")
    (getPath "syncthing")
    (getPath "ani-cli")
    (getPath "intellij")

    # Variable Apps
    (getPath "${settings.terminal}")  # BROWSER
    (getPath "${settings.browser}")   # TERMINAL
  ];
}
