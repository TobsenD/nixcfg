{ config, ... }:
{
  flake.nixosModules.base-cli = with config.flake.base-cli; {
    imports = [
      neovim
      starship
      zsh
      git
    ];
  };
}
