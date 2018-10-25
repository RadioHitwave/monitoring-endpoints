#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
OUT=$1

mkdir -p $OUT
rm $OUT/* &>/dev/null | true

function generate {
	$DIR/scripts/$1.sh > $OUT/$1.txt
}

generate backup-timestamps
generate backups-up-to-date
