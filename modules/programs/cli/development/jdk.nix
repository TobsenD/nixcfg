{
  flake.development.jdk =
    { pkgs, ... }:
    {
      # Only LTS
      environment.systemPackages = with pkgs; [
        javaPackages.compiler.openjdk8 # December 2030
        javaPackages.compiler.openjdk11 # January 2032
        javaPackages.compiler.openjdk17 # September 2029
        javaPackages.compiler.openjdk21 # September 2031
        javaPackages.compiler.openjdk25 # September 2033
      ];
    };
}
