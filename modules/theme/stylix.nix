{ inputs, ... }:
{
  flake.nixosModules.theme = {
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
    };
  };
}
