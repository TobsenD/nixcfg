/*
  Required to define `graphics` in multiple files.

  Otherwise:
    The option `flake.graphics' is defined multiple times while it's expected to be unique.
*/
{ lib, flake-parts-lib, ... }:
{
  options = {
    flake = flake-parts-lib.mkSubmoduleOptions {
      graphics = lib.mkOption {
        type = with lib.types; lazyAttrsOf raw;
        default = { };
      };
    };
  };
}
