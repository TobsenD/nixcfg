{ config, ... }:
{
  flake.nixosModules.office-cli = with config.flake.office; {
    imports = [
      joplin-cli
    ];
  };
}
