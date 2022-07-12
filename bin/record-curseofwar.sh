#!/bin/sh

"$(dirname "$(readlink -f "$0")")"/asciinema.sh \
  curseofwar -q 1 -i 4 -s n -d hh -W 19 -H 15

# -T # >= 80x28
