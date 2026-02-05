{
  flake.nixosModules.theme = {pkgs, ...}: {
      stylix.image = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/nord_mask.png";
        hash = "sha256-TCUu0bghosN0KL6myuF0w7hwmyhYUup0ORrPS0wjNG0=";
      };
    };
}
