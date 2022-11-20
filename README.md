# dev-flakes

This is a collection of [Nix Flakes](https://nixos.wiki/wiki/Flakes) I have put
together to easily build or work on projects that don't have flakes themselves.

## Directory Structure

At the moment, I plan for a directory structure something like the following:

- `flakes/`: Flakes for various projects
  - `github.com/$USER/$REPO`: Flakes for github projects
- `templates/`: Templates that can be used with `nix flake new -t ...`

Putting this structure in place now may make it easier to script cloning or 
building a project in the future.

## Using Flakes

There is no automation at the moment, so you'll just have to copy files to/from
the intended directory or use a symlink.

