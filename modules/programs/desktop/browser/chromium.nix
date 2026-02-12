{
  flake.browsers.chromium =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.chromium
      ];
    };
}
