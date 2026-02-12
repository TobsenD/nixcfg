{
  flake.base-cli.zsh =
    { pkgs, ... }:
    {

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
            k = "kubectl";
          };

          history.size = 10000;

          initContent = ''
            export NIX_PATH=nixpkgs=channel:nixos-unstable
            export NIX_LOG=info
            eval "$(starship init zsh)"
          '';
        };
      };
    };
}
