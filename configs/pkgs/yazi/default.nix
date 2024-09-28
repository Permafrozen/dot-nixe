{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
  ];

  home-manager.users.${settings.userName} = {
    stylix.targets.yazi.enable = true;
  };
}