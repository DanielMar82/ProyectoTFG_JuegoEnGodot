#!/bin/sh
echo -ne '\033c\033]0;ProyectoTFG_JuegoEnGodot\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/ASimpleLifeHistory-Linux-2.arm64" "$@"
