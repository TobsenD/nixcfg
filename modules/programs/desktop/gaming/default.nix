{ config, ... }:
{
  flake.nixosModules.gaming = with config.flake.gaming; {
    imports = [
      steam
      prism
      lutris
    ];
  };
}
