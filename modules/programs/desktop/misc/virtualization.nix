{
  flake.nixosModules.virtualization =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gnome-boxes
      ];
    };
}
