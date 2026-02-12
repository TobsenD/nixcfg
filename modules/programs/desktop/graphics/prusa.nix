{
  flake.graphics.prusa =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.prusa-slicer
      ];
    };
}
