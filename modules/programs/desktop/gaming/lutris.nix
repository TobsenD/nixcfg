{
  flake.gaming.lutris =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.lutris
      ];
    };
}
