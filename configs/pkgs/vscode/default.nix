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
        # Editor Settigns
        "editor.cursorBlinking"= "phase";
        "editor.cursorSmoothCaretAnimation"= "on";
        "editor.fontFamily"= "'Hack Nerd Font'";
        "editor.smoothScrolling"= "true";
        "terminal.integrated.fontFamily"= "'Hack Nerd Font'";
        "terminal.integrated.smoothScrolling"= "true";
        "window.titleBarStyle"= "custom";
        "window.menuBarVisibility"= "compact";
        "workbench.sideBar.location" = "right";
        "editor.renderControlCharacters" = false;
        "workbench.editor.showTabs" = "none";
        "editor.stickyScroll.enabled" = false;
        "editor.lineNumbers"= "relative";

        # Scrollbar Settings
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.minimap.enabled" = false;

        # Vim Keybinds Plugin
        "vim.useCtrlKeys"= false;
      };
    };
    stylix.targets.vscode.enable = true;
  };
}