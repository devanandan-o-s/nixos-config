{ ... }:
{
  imports = [
    ../../configuration.nix
    ../../hardware-configuration.nix
  ];

  networking.hostName = "desktop";
  system.stateVersion = "26.05";
  hardware.graphics.enable = true;

  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
}
