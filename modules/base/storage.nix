{
  flake.nixosModules.base =
    {
      lib,
      inputs,
      pkgs,
      ...
    }:
    {

      nix = {

        # Garbage collection settings
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--keep-derivations --keep-outputs";
        };

        # automatic optimisation of the Nix store
        optimise.automatic = true;

        #Allows old-style Nix commands (e.g. nix-shell without flakes)
        nixPath = [ "/etc/nix/path" ];
      };

    };
}
