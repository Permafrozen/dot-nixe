{ config, pkgs, extensions, settings, ...}:

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
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "phase";
        "workbench.list.smoothScrolling" = "true";
        "editor.smoothScrolling" = "true";
        "terminal.integrated.smoothScrolling" = "true";
      };
    };
    stylix.targets.vscode.enable = true;
  };
}