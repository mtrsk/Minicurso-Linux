#!/usr/bin/env bash

HELP="
HELP
-h  help
-a  all
-l  l
"

if [[ "$1" = "-h" ]]; then
    echo "$HELP"
fi

if [[ "$1" = "-a" ]]; then
    ls -a
fi

if [[ "$1" = "-a" ]]; then
    ls -l
fi

[ "$1" = "-h" ] && echo "Forma reduzida"

# Convertendo IF pra CASE

case "$1" in
    -h) echo "$HELP" && exit 0;;
    -a) ls -a && exit 0;;
    -l) ls -l && exit 0;;
    *) ls -a;;
esac
