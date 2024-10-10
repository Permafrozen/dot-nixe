{ config, pkgs, settings, lib, extensions, ...}:

{
  environment.systemPackages = with pkgs; [
    vscodium
  ];

  programs.direnv.enable = true;
  home-manager.users.${settings.userName} = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;  # Use VSCodium as the VSCode package
      extensions = with extensions.vscode-marketplace; [
        jnoortheen.nix-ide
        vscodevim.vim
      ];
      userSettings = {
        "editor.cursorBlinking"= "phase";
        "editor.cursorSmoothCaretAnimation"= "on";
        "editor.fontFamily"= "'Hack Nerd Font'";
        "editor.smoothScrolling"= "true";
        "terminal.integrated.fontFamily"= "'Hack Nerd Font'";
        "terminal.integrated.smoothScrolling"= "true";
        "window.titleBarStyle"= "custom";
        "workbench.list.smoothScrolling"= "true";
        "workbench.colorCustomizations" = {
          "[Stylix]" = {
            "sideBar.background"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "activityBar.background"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "tab.inactiveBackground"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "editorGroupHeader.tabsBackground"= lib.mkForce "#${config.lib.stylix.colors.base00}";
          };
        };
      };
    };
    stylix.targets.vscode.enable = true;
  };
}