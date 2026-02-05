{
  flake.nixosModules.workVm =
  { config, lib, pkgs, modulesPath, ... }:

  {
    imports =
      [
        (modulesPath + "/profiles/qemu-guest.nix")
      ];

    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/bf3c0d42-39b2-4ea3-ac8c-6bca46647821";
        fsType = "ext4";
      };

    swapDevices = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
