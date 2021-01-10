# [Home](../README.md)
# IT Documentation

This page serves to document various administrative things related to 
Clayton Lab IT infrastructure

* [HCC Work Directory Backup](#hcc-work-directory-backup)

## HCC Work Directory Backup

The work directory is subject to purge and any untouched files will 
be deleted after six months (I think?). Due to the fact that we still have 
plenty of space in `common`, it is currently preferable to maintain backups of the work
directory in `/common/claytonlab`. Although we should always be in a position 
where we can reproduce any prior analyses, it can make our life a lot easier 
if we just have all the prior results on hand until we start running out of space.

Because of reasons, HCC does not allow for us to utilize various automation 
tools, thus I have left a script at `/common/claytonlab/shared/work_backup/backup.sh`.

This may take quite awhile to run, so the best way to do this is using `screen`.
After logging in, just do the following:

```bash
$ screen -dm bash /common/claytonlab/shared/work_backup/backup.sh
```

This backup script is available for reference [here](./backup.sh).

In order to sort-of automate this, [this script](auto_backup.sh) can help to do this. Basically,
every time you login, it will check to see if it's been a week since the work directory 
has been backed up. If this is the case, it will then do the backup. The date of the 
last backup is stored in a text file at `/common/claytonlab/shared/work_backup/last_backup_date`

To set your account up to do this, run the following:

```bash
$ echo "bash /common/claytonlab/shared/work_backup/auto_backup.sh" >> ~/.bashrc
```

If we start running out of space this must be disabled.
