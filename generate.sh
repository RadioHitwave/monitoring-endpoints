#!/bin/bash
set -eu

DIR="$(cd "$(dirname "$0")" && pwd)"
OUT=$1

mkdir -p $OUT
rm $OUT/* &>/dev/null | true

for script in "$DIR/scripts"/*.sh; do
	$script > $OUT/$(basename "$script" | sed 's/.sh/.txt/')
done
