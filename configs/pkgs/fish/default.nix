{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs = {
      fish = {
        enable = true;
        shellAliases = {
          tt = "tt -notheme";
          train = "sl -e";
          bonsai = "cbonsai -S";
          matrix = "cmatrix -s";
        };
        shellInit = ''
          set -U fish_greeting
          cd
        '';
      };
      kitty = {
        extraConfig = ''
          shell fish
        '';
        shellIntegration.enableFishIntegration = true;
      };
    };
    stylix.targets.fish.enable = true;
  };

  # Fish as Default Shell
  programs.bash = {
  interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
  };

  environment.systemPackages = with pkgs; [
    acpi
    bat
    cbonsai
    cmatrix
    git
    nurl
    sl
    tree
    vim
    wget
    tt
  ];
}
