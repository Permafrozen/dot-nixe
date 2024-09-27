{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    vscodium
  ];

  programs.direnv.enable = true;

  home-manager.users.${settings.userName} = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;  # Use VSCodium as the VSCode package
    };
  };
}
