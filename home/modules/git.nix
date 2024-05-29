{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password"
  ];

  programs.git = {
    enable = true;

    userName = "Lyze";
    userEmail = "11274700+lyze237@users.noreply.github.com";

    aliases = {
      "a" = "commit --amend";
      "br" = "branch";
      "c" = "commit";
      "ca" = "!git add -A && git commit";
      "co" = "checkout";
      "cp" = "cherry-pick";
      "d" = "diff";
      "dc" = "diff --cached";
      "f" = "fetch";
      "g" = "log --graph --pretty=custom";
      "l" = "log --pretty=custom";
      "lc" = "shortlog --summary --numbered";
      "p" = "push";
      "r" = "rebase";
      "rlc" = "reset --hard HEAD~1";
      "s" = "status";
      "ulc" = "reset --soft HEAD~1";
      "w" = "instaweb --httpd=webrick";
    };

    extraConfig = {
      core = {
        editor = "code --wait";
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      
      diff = {
        tool = "vscode";
      };
      "difftool \"vscode\"" = {
        cmd = "code -n -w --diff \"$LOCAL\" \"$REMOTE\"";
        trustExitCode = false;
      };
 
      merge = {
        tool = "vscode";
      };
      "mergetool \"vscode\"" = {
        cmd = "code -n -w \"$MERGED\"";
      };

      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDlBZ+q5Amnc7/fhTXlXTCWMSQ68Fx9DDZkYgF8ysw/r";
      };

      init = {
        "defaultBranch" = "main";
      };

      safe = {
        directory = "/etc/nixos";
      };
    };
  };
}
