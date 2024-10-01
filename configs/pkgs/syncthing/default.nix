{ config, pkgs, settings, ... }:

{
  services = {
    syncthing = {
        enable = true;
        user = "${settings.userName}";
        dataDir = "/home/${settings.userName}/Documents/Synced";    # Default folder for new synced folders
        configDir = "/home/${settings.userName}/Documents/Synced/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
  };

  # Disable default folder
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
  
  # Ports for Syncthing
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}