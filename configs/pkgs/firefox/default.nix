{ config, pkgs, settings, ...}:

{
  home-manager.sharedModules = [{
    programs.firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
          "browser.search.region" = "${settings.searchRegion}";
          "browser.search.isUS" = false;
          "distribution.searchplugins.defaultLocale" = "${settings.locale}";
          "general.useragent.locale" = "${settings.locale}";
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.newtabpage.pinned" = [{
            title = "NixOS";
            url = "https://nixos.org";
          }];
        };
        userChrome = ''

        '';
      };
    };
  }];
}