{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    ani-cli
  ];
}