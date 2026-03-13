{
  flake.base-cli.btop =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        btop-rocm
      ];

    };
}
