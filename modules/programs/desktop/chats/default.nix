{ config, ... }:
{
  flake.nixosModules.chats = with config.flake.chats; {
    imports = [
      element
      discord
      signal
    ];
  };
}
