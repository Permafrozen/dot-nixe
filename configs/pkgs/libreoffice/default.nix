{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.de_AT
  ];
}