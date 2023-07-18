{
  inputs.nixpkgs.url = "nixpkgs";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system} = rec {
        book = with pkgs; mkShell { buildInputs = [ typescript ]; };
        default = book;
      };
    };
}
