{ config, pkgs, settings, ...}:

{
  home-manager.sharedModules = [{
    programs.lazygit = {
      enable = true;
      settings = {

      };
    };
  }];
}