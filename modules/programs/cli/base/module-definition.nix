/*
  Required to define `base-cli` in multiple files.

  Otherwise:
    The option `flake.base-cli' is defined multiple times while it's expected to be unique.
*/
{ lib, flake-parts-lib, ... }:
{
  options = {
    flake = flake-parts-lib.mkSubmoduleOptions {
      base-cli = lib.mkOption {
        type = with lib.types; lazyAttrsOf raw;
        default = { };
      };
    };
  };
}
