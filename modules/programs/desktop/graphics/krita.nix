{
  flake.graphics.krita =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.krita
      ];
    };
}
