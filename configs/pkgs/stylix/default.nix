{ config, pkgs, settings, ...}:

let 
  stylixConfig = {
    enable = true;
    autoEnable = false;
    image = ../../../assets/wallpapers/${settings.wallpaper};
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${settings.scheme}.yaml";
    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = {
        name = "Noto Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      monospace= {
        name = "Hack Nerd Font";
        package = pkgs.nerdfonts;
      };
    };
  };
in {
  environment.systemPackages = with pkgs; [
    base16-schemes
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

  stylix = stylixConfig;

  home-manager.sharedModules = [{
    stylix = stylixConfig;
  }];
}
