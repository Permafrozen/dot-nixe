{ config, pkgs, settings, ... }:

{
  hardware = {
    graphics = {
      enable = true;
    };
    
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  
  boot.kernelParams = [ "video=1920x1080" ];

  services.xserver.videoDrivers = ["nvidia"];

  home-manager.users.${settings.userName} = {
    wayland = {
      windowManager.hyprland.extraConfig = ''
        env = LIBVA_DRIVER_NAME,nvidia
        env = XDG_SESSION_TYPE,wayland
        env = GBM_BACKEND,nvidia-drm
        env = __GLX_VENDOR_LIBRARY_NAME,nvidia

        cursor {
          no_hardware_cursors = true; 
        }
      '';
    };
  };
}
