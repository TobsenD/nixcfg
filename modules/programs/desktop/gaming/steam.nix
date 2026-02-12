{
  flake.gaming.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.steam
      ];
    };
}
