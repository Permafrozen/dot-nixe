{ config, pkgs, settings, ...}:

{
  environment.systemPackages  = with pkgs; [
    swww
  ];

  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland.extraConfig = ''
      exec-once = swww-daemon
      exec = swww img ~/.dot-nixe/assets/wallpapers/${settings.wallpaper}
    '';
  };
}
