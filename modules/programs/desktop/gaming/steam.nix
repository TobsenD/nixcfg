{
  flake.gaming.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gaming
      ];
    };
}
