{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      repo = pkgs.fetchFromGitHub {
        owner = "waltermoreira";
        repo = "test-submodules";
        rev = "69b5a04b92e7d483511841c49ea165d6e54d578f";
        hash = "sha256-sU69mCYWy/O+Iphm4BCsSrw6OWqA0V3ox8tSiwjpLK4=";
        # fetchSubmodules = true;
      };
    in
    {
      packages.${system}.default = repo;
    };
}
