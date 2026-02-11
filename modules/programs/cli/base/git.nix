{
  flake.base-cli.git =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        gh
      ];
    };
}
