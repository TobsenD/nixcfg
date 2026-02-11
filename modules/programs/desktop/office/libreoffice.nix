{
  flake.office.libreoffice =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.libreoffice
      ];
    };
}
