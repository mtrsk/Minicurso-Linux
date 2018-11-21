#!/usr/bin/env bash

HELP="
$0 - [ Options ]
-i      System  ID
-n      System Name
-h      Help
-p      Pretty Name
-v      $0 version
-u      Home URL
--sv    System Version
"

VERSION="0.0.1"

OS_RELEASE="$(cat /etc/os-release | cut -d = -f 2)"
RESULT=""

# Flags

OP_NAME=0
OP_ID=0
OP_PRETTY=0
OP_HURL=0

# Checa se algum argumento foi passado

if [ -z $1 ]; then
    echo "Use -h para help"
    exit 1
fi

while test -n "$1"
do
    case "$1" in
        -a) echo "$OS_RELEASE" && exit 0;;
        -h) echo "$HELP" && exit 0;;
        -n) OP_NAME=1;;
        -i) OP_ID=1;;
        *) echo "Opção inválida";;
    esac
    shift
done

[ $OP_NAME -eq 1 ] && echo "$OS_RELEASE" | sed -n 2p
[ $OP_ID -eq 1 ] && echo "$OS_RELEASE" | sed -n 1p

echo "$OP_NAME"
echo "$OP_ID"