{
  description = "Provides a devshell for cue-gh-workflows.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    qjcg.url = "github:qjcg/nix";
  };

  outputs = { self, ... }@inputs:
    let
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        overlays = [
          inputs.qjcg.overlay
        ];
      };
    in
    {
      devShell.x86_64-linux = (
        { pkgs, ... }:

          with pkgs;

          mkShell {
            name = "devshell-cue-gh-workflows";
            buildInputs = [ jg.custom.cue ];
          }
      ) { inherit pkgs; };
    };
}
