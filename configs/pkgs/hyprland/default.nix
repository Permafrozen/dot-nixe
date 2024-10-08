{ config, pkgs, settings, ...}:

{

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprshot # for screenshots
  ];

  # For Screenshare
  environment = {
    variables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {

        # Variables
        "$mainMod" = "SUPER";
        "$browser" = "${settings.browser}";
        "$terminal" = "${settings.terminal}";

        # Monitor Settings
        "monitor"="eDP-1,1920x1080@60,0x0,1";


        general = {
          border_size = "1";
          "col.active_border" = "0xff${config.lib.stylix.colors.base05}";
          "col.inactive_border" = "0xff${config.lib.stylix.colors.base04}";
          resize_on_border = "true";
          
          gaps_in = "${settings.gaps}";
          gaps_out = "${settings.gaps}";

          layout = "dwindle";
          allow_tearing = "false";
        };

        decoration = {
          rounding = "${settings.rounding}";

          active_opacity = "1";
          inactive_opacity = "1";
          fullscreen_opacity = "1";

          drop_shadow = "${settings.shadow}";
          shadow_range = "4";
          shadow_render_power = "4";
          shadow_ignore_window = "true";
          "col.shadow" = "0xee${config.lib.stylix.colors.base05}";
          "col.shadow_inactive" = "0xee${config.lib.stylix.colors.base04}";

          dim_inactive = "false";
          dim_strength = "0.5";

          blur = {
            enabled = "true";
            size = "8";
            passes = "1";
            ignore_opacity = "false";
            xray = "true";
            popups = "true";
          };
        };

        animations = {
          enabled = "true";
          first_launch_animation = "true";

          bezier = [
            "overshoot, 0.01,-0.11,0.23,1.23"
            "overshoot2, 0.51,0.23,0.23,1.28"
          ];

          animation = [
            # windows in & out
            "windowsIn, 1, 5, overshoot2, slide"
            "windowsOut, 1, 5, overshoot2, slide"
            "windowsMove, 1, 5, overshoot2, slide"

            # Workspaces in & out
            "workspacesIn, 1, 6, overshoot, slidefade"
            "workspacesOut, 1, 6, overshoot, slidefade"
          ];
        };

        bind = [
          # Important Keybinds
          "$mainMod, T, exec, kitty"
          "$mainMod, S, exec, $browser"
          "$mainMod, Q, killactive,"
          "$mainMod, M, exit,"
          "$mainMod, F, fullscreen,"

          # Screenshot keybinds
          "$mainMod, PRINT, exec, hyprshot -m region"

          # move to workspace
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # move active window to workspace
          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        ];

        # Cursor resize/move
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        input = {
          kb_layout = "de";
        };

        gestures = {
          workspace_swipe = "false";
          workspace_swipe_fingers = "3";
        };

        misc = {
          disable_hyprland_logo	= "true";
          disable_splash_rendering = "true";
          background_color = "0x${config.lib.stylix.colors.base00}";
        };

        windowrulev2 = [
          "maximize, class:^(mpv)$" # For watching anime
        ];
      };

      extraConfig = ''
        monitor=HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1 
      '';
    };
  };
}
