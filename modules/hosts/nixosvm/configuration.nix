{ inputs, self, ... }:
{
  flake.nixosConfigurations.nixosvm = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostVm
    ];
  };

  flake.nixosModules.hostVm =
    { pkgs, ... }:
    {
      imports = [
        # System
        self.nixosModules.base
        self.nixosModules.kvmGuest
        self.nixosModules.printing
        self.nixosModules.homeManager

        # Desktop
        self.nixosModules.gnome
        self.nixosModules.theme

        # Software
        self.nixosModules.git
        self.nixosModules.neovim
        self.nixosModules.firefox
        self.nixosModules.zeditor
        self.nixosModules.zsh
        self.nixosModules.starship
        self.nixosModules.chats
        self.nixosModules.gaming
        self.nixosModules.office
      ];

      boot.loader.grub = {
        enable = true;
        device = "/dev/vda";
        useOSProber = true;
      };
      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "nixos";
      networking.networkmanager.enable = true;

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      environment.variables = {
        ZED_ALLOW_EMULATED_GPU = 1;
      };

      system.stateVersion = "25.11";
    };

}
