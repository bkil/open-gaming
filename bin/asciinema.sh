#!/bin/sh

[ $# -gt 0 ] || {
  echo "usage: $0 [executable and arguments]"
  exit 1
}

X=`tput cols`
Y=`tput lines`
[ -n "$X" ] && [ -n "$Y" ] && XY=" ${X}x$Y"

START="`date +%s`"
TIME="`date -u -d@$START +%Y-%m-%dT%H%M`"
FILE1="$1-$TIME.cast"
CMD="$*"

asciinema \
  rec \
  --idle-time-limit 2 \
  --title "$CMD # $TIME$XY" \
  --command "$CMD" \
  --env SHELL,TERM \
  "$FILE1"
END="`date +%s`"
LEN="`expr $END - $START`"

FILE2="$1-$TIME-$LEN.cast"
mv "$FILE1" "$FILE2"
ls -l "$FILE2"
