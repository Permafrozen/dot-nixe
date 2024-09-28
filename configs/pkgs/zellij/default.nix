{ config, pkgs, settings, lib,  ... }:

{
  home-manager.users.${settings.userName} = {
    programs.zellij = {
      enable = true;
      settings = {
        simplified_ui = true;
        default_shell = "fish";
        default_layout = "compact";
        pane_frames = true;
        ui.pane_frames = {
            rounded_corners = true;
            hide_session_name = true;
        };
        themes.stylix.green = lib.mkForce "#${config.lib.stylix.colors.base05}";
      };
    };
    stylix.targets.zellij.enable = true;
  };
}