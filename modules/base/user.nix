{
  flake.nixosModules.base = {pkgs, ... }: {

    users.users.tobsend = {
      isNormalUser = true;
      description = "Tobias Dols";
      extraGroups = [ "networkmanager" "wheel" ];
    };

  };
}
