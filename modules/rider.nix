{ pkgs, lib, ... }:
let
  extra-path = with pkgs; [
    dotnetCorePackages.sdk_6_0
    dotnetCorePackages.sdk_8_0
    dotnetPackages.Nuget
    mono
    msbuild
    fontconfig
    gnumake
    icu
    openssl
    # Add any extra binaries you want accessible to Rider here
  ];

  extra-lib = with pkgs; [
    libGL xorg.libX11 xorg.libXi xorg.libICE xorg.libSM fontconfig.lib libgdiplus
    # Add any extra libraries you want accessible to Rider here
  ];

  rider = pkgs.jetbrains.rider.overrideAttrs (attrs: {
    postInstall = ''
      # Wrap rider with extra tools and libraries
      mv $out/bin/rider $out/bin/.rider-toolless
      makeWrapper $out/bin/.rider-toolless $out/bin/rider \
        --argv0 rider \
        --prefix PATH : "${lib.makeBinPath extra-path}" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"

      # Making Unity Rider plugin work!
      # The plugin expects the binary to be at /rider/bin/rider,
      # with bundled files at /rider/
      # It does this by going up two directories from the binary path
      # Our rider binary is at $out/bin/rider, so we need to link $out/rider/ to $out/
      shopt -s extglob
      ln -s $out/rider/!(bin) $out/
      shopt -u extglob
    '' + attrs.postInstall or "";
  });
in
{
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];


  environment.systemPackages = [
    rider
  ];
}
