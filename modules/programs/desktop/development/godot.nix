{
  flake.development.godot =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.godot
      ];
    };
}
