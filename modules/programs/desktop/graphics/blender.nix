{
  flake.graphics.blender =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.blender
      ];
    };
}
