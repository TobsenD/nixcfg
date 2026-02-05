{inputs, self, ... }:
{
  flake.nixosConfigurations.nixosvm = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostVm
    ];
  };

flake.nixosModules.hostVm = { pkgs, ... }:
{
  imports = [
    self.nixosModules.base
    self.nixosModules.printing
    self.nixosModules.gnome
    self.nixosModules.firefox
    self.nixosModules.git
    self.nixosModules.neovim
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

  system.stateVersion = "25.11"; # Did you read the comment?

};

}
