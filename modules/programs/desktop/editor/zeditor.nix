{
  flake.nixosModules.zeditor = {pkgs, ... }: {
    environment.systemPackages = [
        pkgs.zed-editor
      ];
  };
}
