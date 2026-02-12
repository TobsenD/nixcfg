{
  flake.gaming.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.steam
      ];

      programs.steam.enable = true;
    };
}
