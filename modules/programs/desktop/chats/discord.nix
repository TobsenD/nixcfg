{
  flake.chats.discord = {pkgs, ... }: {
    environment.systemPackages = [
        pkgs.discord
      ];
  };
}
