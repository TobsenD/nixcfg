{
  flake.nixosModules.base = {pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      fira-code
      fira-code-symbols
      nerd-fonts.fira-code
      font-manager
      font-awesome_5
      noto-fonts
    ];
  };
}
