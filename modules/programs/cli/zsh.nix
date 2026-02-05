{
  flake.nixosModules.zsh = {pkgs, ... }: {

    programs.zsh.enable = true;

    home-manager.users.tobsend = {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ll = "ls -la";
          vim = "nvim";
        };

        history.size = 10000;

        initContent = ''
          export NIX_PATH=nixpkgs=channel:unstable
          export NIX_LOG=info
          eval "$(starship init zsh)"
        '';
      };
    };
  };
}
