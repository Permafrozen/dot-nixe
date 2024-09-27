{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.kitty = {
      enable = true;
      settings = {
        foreground = "#${config.lib.stylix.colors.base05}";
        background = "#${config.lib.stylix.colors.base00}";
        background_opacity = "${settings.opacity}";
        background_blur = "${settings.blur}";
        confirm_os_window_close = "0";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    acpi
    bat
    git
    nurl
    tree
    vim
    wget
  ];
}
