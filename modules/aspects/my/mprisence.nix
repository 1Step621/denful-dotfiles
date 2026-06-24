{ my, ... }:
{
  my.mprisence = {
    includes = [ my.desktop ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.mprisence ];

      home.file.".config/mprisence/config.toml".text = ''
        [player.Gapless]
        ignore = false
      '';

      programs.niri.settings.spawn-at-startup = [
        { command = [ "mprisence" ]; }
      ];
    };
  };
}
