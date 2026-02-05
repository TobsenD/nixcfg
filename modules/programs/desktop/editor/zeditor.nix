{
  flake.nixosModules.zeditor = {pkgs, ... }: {
    environment.systemPackages = [
        pkgs.zed-editor
        pkgs.nerd-fonts.zed-mono
      ];
  };
}
