{
  flake.nixosModules.base =
    { pkgs, ... }:
    {

      nix = {

        # Garbage collection settings
        gc = {
          automatic = true;
          dates = "weekly";
          options = {
            keepDerivations = true;
            keepOutputs = true;
          };
        };

        # automatic optimisation of the Nix store
        optimise.automatic = true;

        # flake registry settings
        registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
          (lib.filterAttrs (_: lib.isType "flake")) inputs
        );

        #Allows old-style Nix commands (e.g. nix-shell without flakes)
        nixPath = [ "/etc/nix/path" ];
      };

    };
}