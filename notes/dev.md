# Development notes

The repo is structured to be relatively easy to build on a standard Linux
installation. Running `make help` shows what the build targets do. To run
everything the following is required:
- latex
- scons
- biber
- inotifytools (only for `make watch`)

If you want, there is a nix flake which provides a dev shell. Installing nix,
enabling flakes ([install guide](https://zero-to-nix.com/start/install)), and
running `nix develop` in the root directory of this project will drop you into
a shell with all the needed packages to work on the code. This is how the
automated actions run as well.

## SemVer

We try to follow [semver](https://semver.org/), that is every version number is of the form
`Major.Minor.Patch`. Basically: if you change the package this version will have to be
bumped according to the following rules:
- If you make a backwards incompatible change the major version must increment
- If you add a new feature the minor version must increment
- If you fix a bug (in a backwards compatible way) then the patch version increments
