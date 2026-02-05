{
  flake.chats.signal = {pkgs, ... }: {
    environment.systemPackages = [
        pkgs.signal-desktop
      ];
  };
}
