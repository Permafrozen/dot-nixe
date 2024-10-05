{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs = {
      fish = {
        enable = true;
        shellAliases = {
          tt = "tt -notheme";
        };
        shellInit = ''
          set -U fish_greeting
          cd
        '';
      };
      kitty = {
        extraConfig = ''
          shell fish
        '';
        shellIntegration.enableFishIntegration = true;
      };
    };
    stylix.targets.fish.enable = true;
  };
}
