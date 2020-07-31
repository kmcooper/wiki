# Basics

### What is `PATH`?

`PATH` comes up frequently in documentation describing Linux administration tasks, 
troubleshooting threads, etc. `PATH` is an environmental variable that describes where 
executable files (software) might be located in a system, so that when you type `mkdir` 
into the `bash` shell, the system knows where to look to find the program `mkdir`.

You can see your `PATH` at any time by using `$ echo $PATH`.

Module usage on HCC primarily relies on `PATH` modification. For example, when you first
log on, your `PATH` might look like this:

```bash
/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/util/opt/bin:/opt/puppetlabs/bin:/home/biocore/your_user_name/bin
```

Then, when you load a module, additions are made to your path:

```bash
$ module load qiime2/2019.10
/util/opt/anaconda/deployed-conda-envs/packages/qiime2/envs/qiime2-2019.10/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/util/opt/bin:/opt/puppetlabs/bin:/home/biocore/your_user_name/bin
```

## Important Notes

* Within this wiki, any time that you see a `$` at the beginning of a line of a code block, 
this indicates that the line is meant to be run in a `bash` shell under a non-root user
account. Any time that you see a `#` at the beginning of a line of a code block, this 
indicates that the line is meant to be run in a `bash` shell as root (or as a user
using `sudo`).
