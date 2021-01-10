#!/usr/bin/env bash

last=$(cat /common/claytonlab/shared/work_backup/last_backup_date)
now=$(date)

elapsed=$(($(date -d "$now" '+%s') - $(date -d "$last" '+%s')))

if [[ $elapsed -gt 604800 ]]; then
    screen -dm bash /common/claytonlab/shared/work_backup/backup.sh
fi
