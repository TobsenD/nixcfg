{
    description = "NixOS configuration using flake-parts and import-tree";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
    };

    outputs = { flake-parts, ...} @ inputs: flake-parts.lib.mkFlake {inherit inputs; }{
        imports = [
            (inputs.import-tree ./modules)
        ];

        systems = [ "x86_64-linux" "aarch64-linux"];
    };
}