{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
      enableFishIntegration = true;
    };
  };
}
