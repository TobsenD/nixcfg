{ config, ... }:
{
  flake.nixosModules.development = with config.flake.development; {
    imports = [
      ansible
      godot
      jdk
      kube
      misc
      platformio
      podman
    ];
  };
}
