{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    vesktop
  ];
  home-manager.users.${settings.userName} = {
    stylix.targets.vesktop.enable = true;
  };
}