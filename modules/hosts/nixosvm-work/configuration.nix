{inputs, self, ... }:
{
  flake.nixosConfigurations.nixosWork = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.workVm
    ];
  };

flake.nixosModules.workVm = { pkgs, ... }:
{
  imports = [
    # System
    self.nixosModules.base
    self.nixosModules.kvmGuest
    self.nixosModules.printing

    # Desktop
    self.nixosModules.gnome
    self.nixosModules.theme

    # Software
    self.nixosModules.git
    self.nixosModules.neovim
    self.nixosModules.firefox
    self.nixosModules.zeditor
  ];

  boot.loader.grub= {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  system.stateVersion = "25.11";
};

}
