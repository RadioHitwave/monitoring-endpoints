#!/bin/bash

container_list="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
for container in $container_list; do
	BACKUP_DATE=$(ls -lh --time-style long-iso /mnt/storage/containers/$container.tar.gz 2>/dev/null | awk '{print $6}')
	CURRENT_DATE=$(date --iso-8601)

	if [ "$BACKUP_DATE" = "$CURRENT_DATE" ]; then
		echo "BCKP_DT_OK - container $container has backup date '$BACKUP_DATE'";
	else
		echo "BCKP_DT_ERROR - container $container has backup date '$BACKUP_DATE'";
	fi
done
