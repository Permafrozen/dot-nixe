{ config, pkgs, settings, ...}:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      # animation
      animation = "none";

      # decoration
      hide_borders = false;
      blank_box = true;

      # misc
      clear_password = false;
      text_in_center = true;
    };
  };
}