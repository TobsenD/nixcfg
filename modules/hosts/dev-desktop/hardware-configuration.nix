{
  flake.nixosModules.devDesktop =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:

    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [
        "kvm-amd"
        "v4l2loopback"
      ];
      boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
      boot.extraModprobeConfig = ''
        options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
      '';

      fileSystems."/" = {
        device = "/dev/mapper/luks-d89f8678-088f-4ef5-b0cd-d447e553c141";
        fsType = "ext4";
      };

      boot.initrd.luks.devices."luks-d89f8678-088f-4ef5-b0cd-d447e553c141".device =
        "/dev/disk/by-uuid/d89f8678-088f-4ef5-b0cd-d447e553c141";

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/7A81-7CC1";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
