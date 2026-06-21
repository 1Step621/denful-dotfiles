{ inputs, my, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      diagram = inputs.den-diagram.lib;
      mmd = diagram.toMermaid (
        diagram.graph.ofNamespace {
          aspects = my;
        }
      );
      mmdFile = pkgs.writeText "diagram.mmd" mmd;
    in
    {
      packages.diagram = pkgs.writeShellApplication {
        name = "diagram";
        runtimeInputs = [
          pkgs.mermaid-cli
          pkgs.xdg-utils
        ];
        text = ''
          mmdc -i ${mmdFile} -o /tmp/diagram.png -s 10
          xdg-open /tmp/diagram.png
        '';
      };
    };
}
