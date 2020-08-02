# Projects

This page serves as documentation for a general structure for the bioinformatics side
of current projects. This is always in flux and we can change it at any time. In general,
choices should be deliberate, logical, and utilize best practices. Lean on `git` for 
version control.

* [Project Structure](#project-structure)
* [Pipeline Scripts](#pipeline-scripts)

## Project Structure

Single projects should be contained within a single directory. Within this directory, 
there are various ways to potentially organize files. Here is one possible example:

* `project/artifacts` - a directory to store QIIME2 artifacts (`.qza` and `.qzv`)
* `project/data` - a directory to store raw sequence data (FASTQ files) 
* `project/exports` - a directory containing QIIME2 exports
* `project/metadata.tsv` - a file containing experimental metadata
* `project/pipelines` - a directory containing analysis pipelines
* `project/script_output` - a directory containing pipeline STDOUT and STDERR
* `project/scripts` - a directory containing utility scripts

## Pipeline Scripts

Pipeline scripts are simply `bash` scripts that are run on HCC compute resources. HCC
uses [Slurm](https://slurm.schedmd.com/overview.html) for cluster management, so some 
people like to designate scripts intended for compute jobs by ending the file names in 
`.slurm`, but this is not strictly necessary. 

There are a few practices that can be very valuable for documentation and troubleshooting
that are good to include in any pipeline scripts. STDOUT and STDERR should be appended 
to log files so that there is a single historical record of all runs. Logging is very 
important in scientific computing. It's also very helpful to include the `git` branch 
and abbreviated commit hash in logs. The header for a pipeline script might look like
this:

```bash
#!/bin/bash 						# shebang line 
#SBATCH --nodes=1					# 1 node
#SBATCH --ntasks-per-node=16				# 16 threads
#SBATCH --mem=80000					# 80GB RAM	
#SBATCH --time=10:00:00					# 10 hours for the job
#SBATCH --job-name=job_name				# job name
#SBATCH --error=/path/to/project/script_output/err.out	# STDERR path
#SBATCH --output=/path/to/project/script_output/std.out	# STDOUT path
#SBATCH --open-mode=append				# append STDERR and STDOUT to files

# This is a log delimiter to make logs easier to read
echo "######################################"

# Add the date and time of the run start
echo "`date` - New run"

# Get the git branch and abbreviate commit hash and add to the log
git_branch=$(git rev-parse --abbrev-ref HEAD)
git_commit_hash_abbrev=$(git log -1 --format=%h)

echo "`date` - Branch: $git_branch"
echo "`date` - Commit: $git_commit_hash_abbrev"

# cd to project directory
cd /path/to/project

# make directories if they don't already exist (-p flag)
mkdir -p artifacts
mkdir -p exports

# load modules
module load qiime2/2019.10

# proceed with pipeline
```
