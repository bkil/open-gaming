#!/bin/bash

SEED="$((2*(RANDOM * 32768 + RANDOM) + RANDOM % 2))"
exec "$(dirname "$(readlink -f "$0")")"/asciinema.sh \
  curseofwar -q 4 -i 4 -s n -d hh -W 19 -H 15 -R "$SEED"

# -T # >= 80x28
