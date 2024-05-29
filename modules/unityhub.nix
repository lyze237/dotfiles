{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.unityhub.override {
      extraPkgs = fhsPkgs: [
        fhsPkgs.harfbuzz
        fhsPkgs.libogg
      ];

      extraLibs = fhsPkgs: [
        fhsPkgs.openssl_1_1
      ];
    })
  ];
}

