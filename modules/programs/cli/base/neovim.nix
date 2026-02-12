{
  flake.base-cli.neovim =
    { config, pkgs, ... }:
    {

      home-manager.users.tobsend =
        { config, ... }:
        {
          stylix.targets.neovim.enable = false;
          programs.neovim.enable = true;
          home = {
            packages = with pkgs; [
              statix
              ripgrep
              nil
              nixpkgs-fmt
              gcc
              fd
            ];

            sessionVariables = {
              EDITOR = "nvim";
            };

          };

          xdg.configFile."nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/tobsend/Development/nix-dotfiles/nvim/";
            recursive = true;
          };
        };
    };
}
