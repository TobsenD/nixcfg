{
  flake.nixosModules.devLaptop =
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
        "nvme"
        "xhci_pci"
        "thunderbolt"
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
        device = "/dev/mapper/luks-274768d6-42f2-46d3-ab91-f2333ad8022c";
        fsType = "ext4";
      };

      boot.initrd.luks.devices."luks-274768d6-42f2-46d3-ab91-f2333ad8022c".device =
        "/dev/disk/by-uuid/274768d6-42f2-46d3-ab91-f2333ad8022c";

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/9A3A-EAB1";
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
