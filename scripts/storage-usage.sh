#!/bin/bash

lxd_storage_use=`df | grep lxd-btrfs | awk -F" " '{print $5}' | cut -d% -f1`
backup_storage_use=`df | grep /mnt/storage | awk -F" " '{print $5}' | cut -d% -f1`
root_storage_use=`df | grep sda3 | awk -F" " '{print $5}' | cut -d% -f1`

function test {
	[[ $1 -gt $2 ]] && echo "STORAGE_USE_TOO_HIGH ($1% > $2%) - $3" || echo "STORAGE_USE_OK ($1% < $2%) - $3"
}

test $lxd_storage_use 90 "lxd"
test $backup_storage_use 70 "backup"
test $root_storage_use 60 "root"
