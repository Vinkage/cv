{
  inputs = {
    nixpkgs.url = "nixpkgs";
    nix-filter.url = "github:numtide/nix-filter";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs =
        import inputs.nixpkgs
        {
          inherit system;
        };
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-medium latex-bin latexmk
          enumitem etaremune hyperref amsmath titlesec pbox;
      };
    in {
      devShells.default = pkgs.mkShell {
        name = "dev";
        buildInputs = [
          pkgs.coreutils
          tex
        ];
      };
    });
}
