{
  flake.nixosModules.gnome =
    { pkgs, ... }:
    {

      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };

      environment.gnome.excludePackages = (
        with pkgs;
        [
          atomix # puzzle game
          epiphany # web browser
          evince # document viewer
          gnome-tour
          hitori # sudoku game
          iagno # go game
          tali # poker game
        ]
      );
    };
}
