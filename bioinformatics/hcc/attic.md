# [Home](../../README.md)
# Attic

## Backing up everything with attic

This is the temporary solution. First login to HCC.

Open up a new screen window with a shell:

```bash
$ screen -R
```

Then, run the `rsync` command:

```bash
$ rsync -avz /common/claytonlab/* jbclayton@attic.unl.edu:/attic/claytonlab/common
```

Then leave the screen window by typing `control + a` and then pressing the `d` key
