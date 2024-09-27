{ config, pkgs, ...}:

{
  home-manager.sharedModules = [{
    programs.firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
          "browser.search.region" = "AT";
          "browser.search.isUS" = false;
          "distribution.searchplugins.defaultLocale" = "de_AT";
          "general.useragent.locale" = "de_AT";
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