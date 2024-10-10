{ config, pkgs, settings, ... }:

{
  home-manger.users.${settings.userName} = {
    programs.foot = {
      enable = true;
      server.enable = true;
      settings = {};
    };
    stylix.targets.foot.enable = true;
  };
}