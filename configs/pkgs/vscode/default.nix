{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    vscodium
  ];

  home-manager.users.${settings.userName} = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;  # Use VSCodium as the VSCode package
    };
    stylix.targets.vscode.enable = true;
  };
}
