{
  inputs,
  ...
}:
{
  flake.nixosModules.homeManager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager.users.tobsend = {
      programs.home-manager.enable = true;
      home.stateVersion = "25.11";
      dconf.enable = true;
    };
  };
}
