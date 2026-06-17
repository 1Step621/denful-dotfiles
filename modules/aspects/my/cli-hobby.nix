{
  my.cli-hobby = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.mprisence
      ];
    };
  };
}
