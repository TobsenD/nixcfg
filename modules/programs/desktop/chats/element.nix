{
  flake.chats.element = {pkgs, ... }: {
    environment.systemPackages = [
        pkgs.element-desktop
      ];
  };
}
