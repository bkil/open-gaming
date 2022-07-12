#!/bin/sh

main() {
  if [ $# != 1 ]; then
    echo "usage: $0 recorded.cast" >&2
    exit 1
  fi
  CAST="$1"
  BCAST="`basename "$CAST"`"
  DIR="`dirname "$CAST"`"

  CSS="$DIR/asciinema-player.css"
  JS="$DIR/asciinema-player.min.js"

  if ! [ -f "$JS" ]; then
    wget \
      -A- \
      -O "$JS" \
      "https://github.com/asciinema/asciinema-player/releases/download/v3.0.1/asciinema-player.min.js" || exit 1
  fi
  if ! [ -f "$CSS" ]; then
    wget \
      -A- \
      -O "$CSS" \
      "https://github.com/asciinema/asciinema-player/releases/download/v3.0.1/asciinema-player.css" || exit 1
  fi

  TITLE="`basename "$CAST"`"
  DETAILS="`head -n 1 "$CAST" | sed "s~\\\"~'~g ; s/~/=/g"`"
  COLS="`echo "$DETAILS" | sed -nr "s~^.*'width': ([0-9]+).*$~\1~; T e; p; :e"`"
  [ -n "$COLS" ] || COLS="80"
  ROWS="`echo "$DETAILS" | sed -nr "s~^.*'height': ([0-9]+).*$~\1~; T e; p; :e"`"
  [ -n "$ROWS" ] || ROWS="24"

  OUTHTML="$DIR/`basename $CAST .cast`.html"
  if [ -f "$OUTHTML" ]; then
    echo "error: $OUTHTML exists" >&2
    exit 1
  fi

  O="$(dirname "$(readlink -f "$0")")"
  sed "
    s~((TITLE))~$TITLE~g
    s~((CAST))~$BCAST~g
    s~((DETAILS))~$DETAILS~g
    s~((COLS))~$COLS~g
    s~((ROWS))~$ROWS~g
  " "$O/web-asciinema.html" > "$OUTHTML"
}

main "$@"
