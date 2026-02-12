{
  flake.base-cli.git =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        gh
        gnupg
        pinentry-gnome3
      ];

      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-gnome3;
      };

    };
}
