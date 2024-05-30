{ config, pkgs, ... }: {
  home = {
    username = "lyze";
    homeDirectory = "/home/lyze";
    stateVersion = "23.11";

    sessionVariables = {
      SSH_AUTH_SOCK = "/home/lyze/.1password/agent.sock";
    };

    packages = with pkgs; [
      neofetch
      htop
      vesktop
      thunderbird
      ungoogled-chromium
      blender-hip
      nextcloud-client
      gimp
      mission-center
      kdePackages.dragon
    ];
  };

  imports = [
    ./modules/bash.nix 
    ./modules/xdg.nix 
    ./modules/vim.nix 
    ./modules/git.nix 
    ./modules/ssh.nix 
    ./modules/kdeconnect.nix

    ./files/files.nix

    ./plasma/plasma.nix
  ];
}   
