{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.lazygit = {
      enable = true;
      settings = {};
    };
    stylix.targets.lazygit.enable = true;
  };
}