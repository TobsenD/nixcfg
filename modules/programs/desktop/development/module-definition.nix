/*
  Required to define `development` in multiple files.

  Otherwise:
    The option `flake.development' is defined multiple times while it's expected to be unique.
*/
{ lib, flake-parts-lib, ... }:
{
  options = {
    flake = flake-parts-lib.mkSubmoduleOptions {
      development = lib.mkOption {
        type = with lib.types; lazyAttrsOf raw;
        default = { };
      };
    };
  };
}
