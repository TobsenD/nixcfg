{
  flake.development.kube =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kubernetes
        kubernetes-helm
        k9s
      ];
    };
}
