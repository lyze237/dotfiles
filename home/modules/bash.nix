{
    programs.bash = {
          enable = true;
          shellAliases = {
                  rebuild-all = "rebuild-os && rebuild-home";
                  rebuild-os = "bash -c 'cd /etc/nixos && sudo nixos-rebuild switch --flake .'";
                  rebuild-home = "bash -c 'cd /etc/nixos && home-manager switch --flake .'";
          };
    };
}

