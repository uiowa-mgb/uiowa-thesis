{
  description = "Devshell for uiowa-thesis";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # This technically pulls in more stuff than necessary to build
    tex = pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-basic # A good minimal base for latex
        biber        # Our bibiolgraphy backend
        biblatex     # Generating the bibliography more better
        lipsum       # Generates random text
        memoir       # The base of our class
        mwe          # Lets us use example images
        xetex        # The actual tex engine to use
        hypdoc       # Used to build the ctan documentation
        xpatch       # I'm not sure why this is needed all of a sudden
        booktabs     # or this one...
        ;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        tex
        pkgs.scons
        pkgs.glow          # make help text prettier
        pkgs.inotify-tools # watches for changes
      ];

      shellHook = ''
        clear
        (
          echo "Welcome to a dev-shell!"
          echo "Run \`make help\` to see all available targets"
        ) | glow
      '';
    };
  };
}
