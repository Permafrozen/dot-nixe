{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.git = {
      enable = true;
      userName = settings.gitUser;
      userEmail = settings.gitMail;
      extraConfig = { init.defaultBranch = settings.defaultBranch; };
    };
  };
}
