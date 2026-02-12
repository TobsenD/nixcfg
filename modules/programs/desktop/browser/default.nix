{ config, ... }:
{
  flake.nixosModules.browsers = with config.flake.browsers; {
    imports = [
      firefox
      chromium
    ];
  };
}
