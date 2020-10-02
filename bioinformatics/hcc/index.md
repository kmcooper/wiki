# HCC/Linux

* [Important Notes](#important-notes)
* [Basic Usage](#basic-usage)
* [What is `PATH`?](#what-is-path)
* [Troubleshooting](#troubleshooting)

This section provides some documentation regarding our use of HCC, general advice,
troubleshooting, etc.

Almost everything here is general Linux advice as well, and will apply to 
most Linux servers and workstations. 

The first place to look if you have any questions or issues with HCC is the
HCC docs:

[hcc.unl.edu/docs](https://hcc.unl.edu/docs)

## Important Notes

* Within this wiki, any time that you see a `$` at the beginning of a line of a code block, 
this indicates that the line is meant to be run in a `bash` shell under a non-root user
account. This is the default situation for HCC.

* Any time that you see a `#` at the beginning of a line of a code block, this 
indicates that the line is meant to be run in a `bash` shell as root (or as a user
using `sudo`). You are not able to run commands as root or with elevated privileges, 
so this does not apply to HCC, but may apply to other Linux machines (or macOS) that
we use.

## Basic Usage

There is a nice list of basic Linux commands with descriptions and examples
at [hcc.unl.edu/docs/connecting/basic_linux_commands](https://hcc.unl.edu/docs/connecting/basic_linux_commands).

These commands will allow you to navigate around HCC in an interactive shell.

You can also precede the vast majority of BSD/GNU/POSIX shell commands and coreutils with 
`man` to access a manual. Many common programs will have `man` pages as well. For example,
to access the man page for `cd`, type `man cd`.

## What is `PATH`?

`PATH` comes up frequently in documentation describing Linux administration tasks, 
troubleshooting threads, etc. `PATH` is an environmental variable that describes where 
executable files (software) might be located in a system, so that when you type `mkdir` 
into the `bash` shell, the system knows where to look to find the program `mkdir`.

You can see your `PATH` at any time by using `$ echo $PATH`. The output is a list 
of directories that contain executable files separated (delimited) by a colon '`:`'.

Module usage on HCC primarily relies on `PATH` modification. For example, when you first
log on, your `PATH` might look like this:

```bash
/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:
/util/opt/bin:/opt/puppetlabs/bin:/home/biocore/your_user_name/bin
```

Then, when you load a module, additions are made to your path:

```bash
$ module load qiime2/2019.10
$ echo $PATH
/util/opt/anaconda/deployed-conda-envs/packages/qiime2/envs/qiime2-2019.10/bin:
/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:
/sbin:/util/opt/bin:/opt/puppetlabs/bin:/home/biocore/your_user_name/bin
```

Virtual environments (like `conda` environments) also typically rely on `PATH`
modification.

## Troubleshooting

This section has some errors that we have run into and solutions to those errors.
If you run into an error, please take note, do a search to resolve the issue, and 
if it is worth adding to the wiki, please do so.

### `Cannot find terminfo for entry 'your_terminal_emulator_program_name'

In this case, `your_terminal_emulator_program_name`, is the name of your 
terminal emulator. This error can occur when launching a `screen` session. 
The cause of this is an environmental variable, $TERM, which is set to the
name of your terminal emulator. 

The quick and easy solution:
```bash
$ export TERM=xterm
```

In general, to find out which TERMs are supported, you can use

```bash
$ ls /usr/share/terminfo/x
```
