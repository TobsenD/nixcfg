{
  flake.browsers.firefox =
    { pkgs, ... }:
    {

      programs.firefox.enable = true;

    };
}
