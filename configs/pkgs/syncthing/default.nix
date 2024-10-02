{ config, pkgs, settings, ... }:

{
  services = {
  syncthing = {
    enable = true;
    user = "${settings.userName}";
    dataDir = "/home/${settings.userName}/Documents/Synced";
    configDir = "/home/${settings.userName}/Documents/Synced/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "josef-laptop" = { id = "NGXEO2S-C3RGM4X-R4FLDPO-DBWVZHJ-OZ46FL3-GYE5XRH-PUYPXEX-7MOPHQI"; };
      };
      folders = {
        "Documents/Synced" = {                    # Folder ID in Syncthing, also the name of folder (label) by default
          label = "Schule";
          path = "/home/${settings.userName}/Documents/Synced";    # Which folder to add to Syncthing
          devices = [ "josef-laptop" ];      # Which devices to share the folder with
        };
      };
    };
  };
};

  # Disable default folder
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
  
  # Ports for Syncthing
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}