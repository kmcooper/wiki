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

Because of reasons, HCC does not allow for us to utilize various automated 
tools, thus I have left a script at `/common/claytonlab/shared/work_backup/backup.sh`.

This may take quite awhile to run, so the best way to do this is using `screen`.
After logging in, just do the following:

```bash
$ screen bash /common/claytonlab/shared/work_backup/backup.sh
```

Then press `CTRL + a` and then `d` to detach from the screen session.

This backup script is available for reference [here](./backup.sh).
