{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    fastfetch
  ];

  home-manager.users.${settings.userName} = {
    programs.fastfetch = {
      enable = true;
      package = pkgs.fastfetch;
      settings = {
        logo = {
          source = "~/.dot-nixe/assets/ascii-art/dot-nixe.txt";
          position = "top";
          padding = {
            top = 2;
            left = 1;
            right = 2;
          };
        };

        display = {
          separator = "  ";
        };

        modules = [
          {
            type = "title";
            format = "{#1}╭───────────── {#}{user-name-colored}";
          }
          {
            type = "custom";
            format = "{#1}│ {#}System Information";
          }
          {
            type = "os";
            key = "{#separator}│  {#keys}󰍹 OS";
          }
          {
            type = "kernel";
            key = "{#separator}│  {#keys}󰒋 Kernel";
          }
          {
            type = "uptime";
            key = "{#separator}│  {#keys}󰅐 Uptime";
          }
          {
            type = "packages";
            key = "{#separator}│  {#keys}󰏖 Packages";
            format = "{all}";
          }
          {
            type = "custom";
            format = "{#1}│";
          }
          {
            type = "custom";
            format = "{#1}│ {#}Desktop Environment";
          }
          {
            type = "de";
            key = "{#separator}│  {#keys}󰧨 DE";
          }
          {
            type = "wm";
            key = "{#separator}│  {#keys}󱂬 WM";
          }
          {
            type = "wmtheme";
            key = "{#separator}│  {#keys}󰉼 Theme";
          }
          {
            type = "display";
            key = "{#separator}│  {#keys}󰹑 Resolution";
          }
          {
            type = "shell";
            key = "{#separator}│  {#keys}󰞷 Shell";
          }
          {
            type = "terminalfont";
            key = "{#separator}│  {#keys}󰛖 Font";
          }
          {
            type = "custom";
            format = "{#1}│";
          }
          {
            type = "custom";
            format = "{#1}│ {#}Hardware Information";
          }
          {
            type = "cpu";
            key = "{#separator}│  {#keys}󰻠 CPU";
          }
          {
            type = "gpu";
            key = "{#separator}│  {#keys}󰢮 GPU";
          }
          {
            type = "memory";
            key = "{#separator}│  {#keys}󰍛 Memory";
          }
          {
            type = "disk";
            key = "{#separator}│  {#keys}󰋊 Disk (/)";
            folders = "/";
          }
          {
            type = "custom";
            format = "{#1}│";
          }
          {
            type = "colors";
            key = "{#separator}│";
            symbol = "circle";
          }
          {
            type = "custom";
            format = "{#1}╰───────────────────────────────╯";
          }
        ];
      };
    };
  };
}