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

      home-manager.users.tobsend =
        { config, ... }:
        {
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

          xdg = {
            configFile = {
              "autostart/firefox.desktop".source =
                "/home/tobsend/Development/nix-dotfiles/autostart/firefox.desktop";
              "autostart/thunderbird.desktop".source =
                "/home/tobsend/Development/nix-dotfiles/autostart/thunderbird.desktop";
              "autostart/element.desktop".source =
                "/home/tobsend/Development/nix-dotfiles/autostart/element.desktop";
              "autostart/signal.desktop".source =
                "/home/tobsend/Development/nix-dotfiles/autostart/signal.desktop";
              "autostart/discord.desktop".source =
                "/home/tobsend/Development/nix-dotfiles/autostart/discord.desktop";
              "autostart/synology.desktop".source =
                "/home/tobsend/Development/nix-dotfiles/autostart/synology.desktop";
            };
          };
        };
    };
}
