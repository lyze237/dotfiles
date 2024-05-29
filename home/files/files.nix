{ pkgs, lib, home-manager , ... }:

{
  home.file = {
    ".config/autostart" = {
      source = ./autostart;
      recursive = true;
    };

    ".config/1Password/ssh/agent.toml" = {
      source = ./1password/agent.toml;
    };

    ".inputrc" = {
      text = ''
$include /etc/inputrc
set completion-ignore-case On
      '';
    };

    ".local/share/applications/jetbrains-rider.desktop".source =
      let
        desktopFile = pkgs.makeDesktopItem {
          name = "jetbrains-rider";
          desktopName = "Rider";
          exec = "/run/current-system/sw/bin/rider";
          icon = "rider";
          type = "Application";
          # Don't show desktop icon in search or run launcher
          extraConfig.NoDisplay = "true";
        };
      in
      "${desktopFile}/share/applications/jetbrains-rider.desktop";
  };
}

