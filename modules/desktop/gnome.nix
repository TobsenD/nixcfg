{
  flake.nixosModules.gnome =
    { pkgs, inputs, ... }:
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

      environment.systemPackages = with pkgs; [
        gnomeExtensions.gsconnect
        gnomeExtensions.alphabetical-app-grid
        gnomeExtensions.caffeine
        gnomeExtensions.removable-drive-menu
      ];

      home-manager.users.tobsend = {
        dconf = {
          settings = {
            "org/gnome/shell" = {
              enabled-extensions = [
                pkgs.gnomeExtensions.gsconnect.extensionUuid
                pkgs.gnomeExtensions.alphabetical-app-grid.extensionUuid
                pkgs.gnomeExtensions.caffeine.extensionUuid
                pkgs.gnomeExtensions.removable-drive-menu.extensionUuid
              ];
            };
          };
        };
      };
    };
}
