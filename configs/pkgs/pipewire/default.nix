{ config, pkgs, settings, ...}:

{
  # pavucontrol
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
  
  # Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
          };
        };
      };
    };
  };

  # Enable the user-level service manager to start PipeWire automatically
  systemd.user.services = {
    pipewire.wantedBy = [ "default.target" ];
    pipewire-pulse.wantedBy = [ "default.target" ];
  };
}
