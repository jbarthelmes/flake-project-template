import (let
  lock = builtins.fromJSON (builtins.readFile ../flake.lock);
  flakeCompat = lock.nodes.flake-compat.locked;
in fetchTarball {
  url = "https://github.com/edolstra/flake-compat/archive/${flakeCompat.rev}.tar.gz";
  sha256 = flakeCompat.narHash;
}) { src = ../.; }
