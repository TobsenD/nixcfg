/*
  Required to define `gaming` in multiple files.

  Otherwise:
    The option `flake.gaming' is defined multiple times while it's expected to be unique.
*/
{ lib, flake-parts-lib, ... }:
{
  options = {
    flake = flake-parts-lib.mkSubmoduleOptions {
      gaming = lib.mkOption {
        type = with lib.types; lazyAttrsOf raw;
        default = { };
      };
    };
  };
}
