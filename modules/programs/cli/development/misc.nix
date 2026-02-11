{
  flake.development.misc =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        h
        cargo
        rustc
        cmake
        libgcc
        gcc
        go
        python3
        nixfmt
      ];
    };
}
