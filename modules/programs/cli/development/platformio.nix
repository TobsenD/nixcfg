{
  flake.development.platformio =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pkgs.platformio-core
      ];
    };
}
