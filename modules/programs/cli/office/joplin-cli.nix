{
  flake.office.joplin-cli =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.joplin-cli
      ];
    };
}
