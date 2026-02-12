{
  flake.nixosModules.sdc =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.synology-drive-client
      ];
    };
}
