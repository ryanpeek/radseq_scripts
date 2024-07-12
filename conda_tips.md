
# General `conda` notes

## Git Authentication

To re-up your https token, try the following:

 - In the env you want gh auth to be available (probably base):
 - `conda install gh --channel conda-forge`

Then `gh auth login`, and proceed. Easiest to paste in a token via https (enter Y).

## Delete env

`conda remove --name ENV_NAME --all`

## Install/create env

### From scratch and install package

`conda create --name py310 python=3.10`

### From env yml file:

 - export: `conda env export > environment.yml`
 - create (named in yml): `conda env create -f environment.yml`
 - create (not named): `conda env create -n <NAME> -f environment.yml`
 - create/update: `conda env update -n <NAME> -f environment.yml`


## Interactive RStudio:

See here: https://github.com/dib-lab/farm-notes/blob/fec47911937b35d35961f8d3a6d67ffa1069187b/getting-started.md#installing-conda

 - To create an Rstudio env:

```{bash}
#| eval: false

conda create -n rstudio rstudio
ssh -X username@farm.cse.ucdavis.edu
srun -t 240 --mem=10g -p high2 --pty bash
conda activate rstudio
rstudio

```


## SLURM template

```
#! /bin/bash -login
#SBATCH -p med2
#SBATCH -J sgc
#SBATCH -t 3-0:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=30gb

# activate conda in general
. "/home/ctbrown/miniconda3/etc/profile.d/conda.sh"

# activate a specific conda environment, if you so choose
conda activate somename

# go to a particular directory
cd /home/ctbrown/2018-paper-spacegraphcats/pipeline-base

# make things fail on errors
set -o nounset
set -o errexit
set -x

### run your commands here!

# Print out values of the current jobs SLURM environment variables
env | grep SLURM
```

