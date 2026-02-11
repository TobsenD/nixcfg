/*
  Required to define `office` in multiple files.

  Otherwise:
    The option `flake.office' is defined multiple times while it's expected to be unique.
*/
{ lib, flake-parts-lib, ... }:
{
  options = {
    flake = flake-parts-lib.mkSubmoduleOptions {
      office = lib.mkOption {
        type = with lib.types; lazyAttrsOf raw;
        default = { };
      };
    };
  };
}
