{ config, pkgs, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.bottom = {
      enable = true;
      settings = {

      };
    };
  };
}