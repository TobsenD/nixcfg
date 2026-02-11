{ config, ... }:
{
  flake.nixosModules.office = with config.flake.office; {
    imports = [
      joplin
      joplin-cli
      libreoffice
      thunderbird
    ];
  };
}
