{
  flake.office.thunderbird =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.thunderbird
      ];
    };
}
