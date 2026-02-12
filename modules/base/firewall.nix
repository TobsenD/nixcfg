{
  flake.nixosModules.base =
    { pkgs, ... }:
    {
      networking.firewall = rec {

        # 1714-1764: KDEConnect

        allowedTCPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
        ];
        allowedUDPPortRanges = allowedTCPPortRanges;
      };

    };
}
