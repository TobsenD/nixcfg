{
  flake.nixosModules.git = {pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      gh
    ];
  };
}
