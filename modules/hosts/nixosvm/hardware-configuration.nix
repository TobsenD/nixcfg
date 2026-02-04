{
  flake.nixosModules.hostVm =
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
      { device = "/dev/disk/by-uuid/eca6c234-9a93-437d-970b-3c67818d33bf";
        fsType = "ext4";
      };

    swapDevices = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
