{ config, pkgs, settings, lib, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.kitty = {
      enable = true;
      settings = {
        foreground = lib.mkDefault "#${config.lib.stylix.colors.base05}";
        background = lib.mkDefault "#${config.lib.stylix.colors.base00}";
        background_opacity = lib.mkForce "${settings.opacity}";
        background_blur = lib.mkForce "${settings.blur}";
        confirm_os_window_close = "0";
        cursor_shape_unfocused = "unchanged";
      };
    };
    stylix.targets = {
      kitty.enable = true;
      bat.enable = true;
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
