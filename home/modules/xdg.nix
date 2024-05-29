{ pkgs, ... }:

{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "kde";
      extraPortals = with pkgs; [
        xdg-desktop-portal-kde
      ];
    };
  };
}

