{
  flake.graphics.gimp =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gimp
      ];
    };
}
