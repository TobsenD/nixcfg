{ config, ... }:
{
  flake.nixosModules.graphics = with config.flake.graphics; {
    imports = [
      gimp
      krita
      blender
      prusa
    ];
  };
}
