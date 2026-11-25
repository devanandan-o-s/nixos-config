{
  description = "NixOS: MangoWM + Noctalia + SDDM";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    # Main system
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Separate unstable package set
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # MangoWM (omit follows if upstream provides a binary cache)
    mangowm = {
      url = "github:mangowm/mango";
    };

    # Noctalia (pinned to the cachix branch with no nixpkgs.follows)
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        {
          nixpkgs.hostPlatform = "x86_64-linux";
        }

        ./hosts/desktop
      ];
    };
  };
}
