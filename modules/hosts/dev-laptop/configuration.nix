{ inputs, self, ... }:
{
  flake.nixosConfigurations.devlaptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.devLaptop
    ];
  };

  flake.nixosModules.devLaptop =
    { pkgs, ... }:
    {
      imports = [
        # System
        self.nixosModules.base
        self.nixosModules.baseCli
        self.nixosModules.kvmGuest
        self.nixosModules.printing
        self.nixosModules.homeManager

        # Desktop
        self.nixosModules.gnome
        self.nixosModules.theme

        # Software
        self.nixosModules.browsers
        self.nixosModules.chats
        self.nixosModules.gaming
        self.nixosModules.office
        self.nixosModules.development
      ];

      boot.loader.grub = {
        enable = true;
        device = "tbd";
        useOSProber = true;
      };
      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "dev-laptop";
      networking.networkmanager.enable = true;

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      system.stateVersion = "25.11";
    };

}
