{
  flake.gaming.prism =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.prismlauncher
      ];
    };
}
