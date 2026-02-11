{ config, ... }:
{
  flake.nixosModules.development = with config.flake.development; {
    imports = [
      godot
      jdk
      misc
      podman
    ];
  };
}
