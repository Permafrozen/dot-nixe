{ config, pkgs, ...}:

{
  home-manager = [{
    programs.firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
      };
    };
  }];
}