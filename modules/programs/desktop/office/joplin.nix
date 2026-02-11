{
  flake.office.joplin =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.joplin
      ];
    };
}
