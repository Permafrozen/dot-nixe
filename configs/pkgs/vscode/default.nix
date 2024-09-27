{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    vscodium;
  ]
  home-manager.sharedModules = [{
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      
    };
  }];
}