{ config, pkgs, ...}:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      cmatrix_fg = "0x8001";
      hide_borders = true;
    };
  };
}