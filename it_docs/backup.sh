#!/usr/bin/env bash

for proj_path in /work/claytonlab/jbclayton/projects/*; do
    backup_path=$(echo $proj_path | sed -E 's#^.*/projects/(.*)$#/common/claytonlab/shared/work_backup/\1#')

    if [[ -d $proj_path ]]; then
        mkdir -p $backup_path

        for sub_file in $proj_path/*; do
            # don't unnecessarily copy the data over, this is already in data_release

            if [[ $(basename $sub_file) != "data" ]]; then
                cp -ru $sub_file $backup_path
            fi
        done
    else
        cp -ru $proj_path $backup_path
    fi
done
