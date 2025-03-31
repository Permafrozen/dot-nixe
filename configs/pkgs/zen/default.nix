{ settings, lib, config, inputs, pkgs, ... }:
let
  cfg = { enable = true; }; # config.my.home.features.zen-browser;
  applicationName = "Zen Browser";
  modulePath = [ "programs" "zen-browser" ];
  mkFirefoxModule = import
    "${inputs.home-manager.outPath}/modules/programs/firefox/mkFirefoxModule.nix";

  decToHex = decimalString:
    let
      decimal = builtins.fromJSON decimalString;
      integer = lib.strings.toInt (toString (builtins.floor (decimal * 255)));
      hex = lib.trivial.toHexString integer;
    in if (lib.stringLength hex) == 1 then "0${hex}" else hex;
in {
  home-manager.users.${settings.userName} = {

    imports = [
      (mkFirefoxModule {
        inherit modulePath;
        name = applicationName;
        wrappedPackageName = "zen-browser-unwrapped";
        unwrappedPackageName = "zen-browser";
        visible = true;
        platforms = {
          linux = {
            vendorPath = ".zen";
            configPath = ".zen";
          };
          darwin = { configPath = "Library/Application Support/Zen"; };
        };
      })
    ];

    options.my.home.features.zen-browser = { enable = lib.mkEnableOption ""; };

    config = lib.mkIf cfg.enable {
      programs.zen-browser = {
        enable = true;
        package = pkgs.wrapFirefox
          (inputs.zen-browser.packages.${pkgs.system}.default.overrideAttrs
            (prevAttrs: {
              passthru = prevAttrs.passthru or { } // {
                inherit applicationName;
                binaryName = "zen";

                ffmpegSupport = true;
                gssSupport = true;
                gtk3 = pkgs.gtk3;
              };

            })) {
              icon = "zen-beta";
              wmClass = "zen";
              hasMozSystemDirPatch = false;
            };

        policies = {
          DisableAppUpdate = true;
          DisablePocket = true;
          DisableMasterPasswordCreation = true;
          DisableFirefoxStudies = true;
          DisableFirefoxAccounts = true;
          DisableTelemetry = true;
          DisableProfileImport = true;
          DisableSetDesktopBackground = true;
          DisplayBookmarksToolbar = "never";
          OfferToSaveLogins = false;

          # Container Configuration
          Containers = {
            Default = [
              {
                name = "chilling";
                icon = "vacation";
                color = "toolbar";
              }

              {
                name = "school";
                icon = "briefcase";
                color = "toolbar";
              }

              {
                name = "linux";
                icon = "gift";
                color = "toolbar";
              }
            ];
          };
        };

        profiles."default" = {
          name = "${settings.userName}";
          id = 0;
          isDefault = true;

          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            privacy-badger
            sponsorblock
            ublock-origin
            bitwarden
            wikiwand-wikipedia-modernized
          ];

          settings = {
            "extensions.autoDisableScopes" = 0;
            "browser.aboutConfig.showWarning" = false;
            "devtools.debugger.remote-enabled" = true;
            "devtools.chrome.enabled" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.tabs.allow_transparent_browser" = true;
            "gfx.webrender.all" = true;
            "zen.view.grey-out-inactive-windows" = false;
            "signon.rememberSignons" = false;
            "browser.translations.automaticallyPopup" = false;
            "zen.workspaces.force-container-workspace" = true;
            "browser.download.lastDir" = "/home/matteo/downloads";
            "zen.welcome-screen.seen" = true;
          };

          search.engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];

              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [{
                template =
                  "https://wiki.nixos.org/index.php?search={searchTerms}";
              }];
              icon = "https://wiki.nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };

            "Perplexity" = {
              urls = [{
                template = "https://www.perplexity.ai/search/?q={searchTerms}";
              }];
              icon = "https://www.perplexity.ai/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@pp" ];
            };

            "MyNixOS" = {
              urls =
                [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
              icon = "https://mynixos.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@my" ];
            };

            "GitHub" = {
              urls = [{
                template =
                  "https://github.com/search?q={searchTerms}&type=repositories";
              }];
              icon = "https://github.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@gh" ];
            };

            "youtube" = {
              urls = [{
                template =
                  "https://www.youtube.com/results?search_query={searchTerms}";
              }];
              icon = "https://www.youtube.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@yt" ];
            };

            "bing".metaData.hidden = true;
            "google".metaData.alias =
              "@go"; # builtin engines only support specifying one additional alias
            "ddg".metaData.alias = "@ddg"; # ^
          };
          userChrome = ''
            :root {
                --main-bg: #${config.lib.stylix.colors.base00}${
                  decToHex settings.opacity
                }
            }
            toolbox#navigator-toolbox.browser-toolbox-background, hbox#zen-main-app-wrapper {
              background-color: transparent !important;
            }

            hbox#browser {
                background-color: var(--main-bg) !important;
                font-family: "Maple Mono NF";
                font-weight: 700
            }

            tabbox#tabbrowser-tabbox * {
                background-color: transparent !important;
                border: none !important;
                box-shadow: none !important;

            }
          '';
        };
      };
    };
  };
}
