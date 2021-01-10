# [Home](../README.md)
# Using Github

* [A Basic Usage Example](#a-basic-usage-example)
* [SSH Keys](#ssh-keys)
* [Cloning a Repository](#cloning-a-repository)
* [Checking local repo status](#checking-repository-status)
* [Updating local repos](#updating-local-repositories)
* [Adding and committing changes](#adding-and-committing-changes)
* [Pushing changes to remote](#pushing-changes-to-remote)

This guide is written for users who will be interacting with GitHub using 
a macOS or Linux operating system in a `bash`, `zsh` or similar shell. 
Windows users may want to look into using Windows Subsystem Linux (WSL)
or consulting other [guides](https://www.pluralsight.com/guides/using-git-and-github-on-windows).

There are also lots of other guides throughout the internet that you can consult.

## A Basic Usage Example

Let's say you want to conduct some analysis in R in one of the current `clayton-lab` projects, 
which is managed in a repository.

You first want to [clone the repository](#cloning-a-repository):

```bash
$ git clone git@github.com:clayton-lab/monkey-experiment.git
```

This will clone the repository to your machine. Then, do your work in an appropriate 
directory. In this case, you might make an R notebook in the `notebooks` directory 
at the path `./monkey-experiment/notebooks/my-R-notebook.Rmd`. So you've made a nice 
notebook, and now you want to add the notebook to the repository, commit the changes, and
push the changes to the remote origin (i.e. to GitHub):

```bash
$ git add ./monkey-experiment/notebooks/my-R-notebook.Rmd
$ git commit -m "I made a very nice notebook that everyone will enjoy"
$ git push origin master
```

Now the notebook is in the origin repository on GitHub, there is a record of all changes made,
and everyone has access to it. This is super important for managing collaboration, backup, and 
reversion (i.e., if we discover there is a problem later, we can always revert to the state of 
any prior commit).

## SSH Keys
Using SSH keys to interact with GitHub will make things easier when interacting
with private repositories. If you do not know if you have any SSH keys, you probably
don't, but you can check by opening up a terminal (CMD + Space, then type Terminal
on mac) and typing the following command:

```bash
$ ls ~/.ssh
```

In this command, do not type the `$`, this indicates that are entering commands
under a user account, if you have a current version of macOS, this may be a `zsh`
shell and show up as `%`. This is a convention in this and other guides simply 
to indicate that the command should be run as a user, if a command is meant to be
run as root, it will be preceeded by `#`. So, simply type `ls ~/.ssh`.

One other note, in this and other guides, you may see a tilda `~` in file paths, 
this is a symbolic link to your home directory for convenience. You can see this
by doing:

```bash
$ cd ~
$ pwd
```

Anyways, to continue.

If you have any SSH keys, you may see a response like:

```bash
$ ls ~/.ssh
id_ecdsa  id_ecdsa.pub
```

If you don't have any keys, you will just see an empty response. If you have 
keys (a key name, a corresponding `.pub` key), then you can skip the next section.

### Generating SSH Keys

If you don't have any SSH keys, you can generate them by doing the following. Just
a nice reminder, if you are ever curious about a command or program, you can always
type `man`, so `man ssh-keygen`. You can also always find [documentation](https://www.ssh.com/ssh/keygen/) on the internet.

To generate SSH public and private keys, use the following command:

```bash
ssh-keygen -t ecdsa -b 521
```

This will produce a prompt asking for a location, just push enter to use the 
default location. It will also ask if you want to password protect the key, 
this is advisable if you will be using the key to access servers. This should 
generate keys, and these can be shown with `ls ~/.ssh`, which should look as
follows:

```bash
$ ls ~/.ssh
id_ecdsa  id_ecdsa.pub
```

### Adding Your SSH Public Key to GitHub

Navigate to [github.com](https://github.com), click on your user icon in the upper
right hand corner, and click on Settings in the drop-down menu. On the left-hand
side menu, click on SSH and GPG keys. Then, click on New SSH key. In the Title
text box, feel free to give the key an informative title, like your computer name.
Next, go back to your terminal, and use the following command:

```bash
cat ~/.ssh/id_ecdsa.pub
```

This command `cat` concatenates files to STDOUT, so it will print your public 
key to the terminal. Your public key is exactly that: it's meant for public 
distribution, never share the corresponding private key (the `id_ecdsa` file). 
Then, copy the key from the output by highlighting it with your cursor, and then 
paste the key into the "Key" text box on the GitHub page that you previously 
opened. Then, click "Add SSH Key".

## Cloning a Repository

In order to clone a repository first open up a terminal. Navigate to the folder
that you want to clone to repository to using the `cd` command. In my case, I 
put all my repositories in a folder in my home directory called `repos`. To make
a folder like this, you can use the command `mkdir ~/repos`. 

So, change directory to your preferred directory:

```bash
$ cd ~/repos
```

Then, use the `git clone` command to clone the repository:

```bash
$ git clone git@github.com:clayton-lab/wiki.git
```

In this command, `git clone` is the command, `git@github.com` designates the 
user `git` at the host `github.com`, and the path after the colon indicates the 
path that it will look to at the server. In this case, the repository is the
wiki repository.

Now, you should see a folder with the repository name, and of course you can check 
with `ls`, and navigate into this folder with `cd`.

## Checking repository status

You can use `git status` to see the current status of your local repository. 

## Updating local repositories

To update your local repository (the directory on your computer), so that everything 
is in sync with the remote repo, simply use:

```bash
$ git pull origin
```

## Adding and committing changes

Once you've made changes to files in your local repo, you can use `git status` to 
see all the changes. Then, you can stage files to be committed by using `git add`:

```bash
$ git add file_name
```

After adding all the files that are relevant to your changes, you can use 

```bash
$ git commit -m "an informative commit message"
```

to commit these changes.

## Pushing changes to remote

To push the changes that you've committed to the remote repository, simply use
`git push origin [branch name]`, so to push to the master branch you would do

```bash
$ git push origin master
```
