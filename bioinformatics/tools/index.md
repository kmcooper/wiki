# Tools
* [General Installation Advice](#general-installation-advice)
* [Using Anaconda](#using-anaconda)
* [Using Virtual Environments](#using-virtual-environments)
* [Shi7}(#shi7)

## General Installation Advice

For most open source software installation is best done through some kind of a package 
manager. Package managers provide numerous benefits: package managers allow for simple 
installation of software; packages are updated with new releases as the maintainers see 
fit (some package management systems put out new releases immediately, others wait until 
longer term stability is verified); package managers ensure that dependencies are 
installed and updated when required.

`pip` and `anaconda` provide package management for Python, in additional `anaconda` 
combines this with virtual environments to allow for case-by-case management of 
dependencies. 

Package managers for Linux distributions vary by distribution, but this is not a method
that we can use to install software on HCC. `anaconda` is a viable option for installing
packages available in their repos. On HCC, some software installation 
needs to happen in cooperation with HCC support. Software written in Python and other
interpreted languages can often just be uploaded as long as dependencies are met.
In addition, statically linked binaries compiled for x86 Linux can often simply 
be uploaded and will work.

## Using Anaconda

Using Anaconda is fairly simple. Installation can be done in the login node, so it's
best to do this there and not utilize compute resources. 

### Installing Packages with Anaconda

### Using Virtual Environments

Virtual environments allow for a sort-of-containerized way of using software that 
ensures that there are no dependency conflicts. This is especially important for 
software written in Python, which tend to leverage previous work from a number of 
different libraries. In addition, breaking version changes can often be prevented 
by specifying versions for dependencies.

Virtual environments can be activated using `conda activate`, for example:

```bash
$ conda activate base
```
Similarly, they can be deactivated with `conda deactivate`.

## Shi7

`shi7` is a short read, auto parameterizing quality control tool for Illumina-produced
sequences. 

*NOTE:* Shi7 currently has some issues but I am working with knights-lab to get these
resolved

#### Installation

`shi7` is probably best installed through `conda`, so that the package is updated 
accordingly and so that you don't have to worry about managing dependencies.

To install `shi7` on HCC run the following commands:

```bash
$ module load anaconda/4.8
$ conda config --add channels knights-lab
$ conda create -n shi7 shi7
```

The first command loads the Anaconda module. The second adds the `knights-lab`
`channel` to your Anaconda channels. The third command creates a virtual environment 
called `shi7` from the `shi7` package, which Anaconda finds in the `knights-lab` 
channel. 

To activate the `shi7` environment, which will place the Shi7 executables in your 
`PATH`:

```bash
$ conda activate shi7
```

#### Removal

To remove the `shi7` environment, which was built from the `shi7` package, simply run:

```bash
$ conda remove --name shi7 --all
```
