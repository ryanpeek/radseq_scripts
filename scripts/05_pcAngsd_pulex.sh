#!/bin/bash

#SBATCH --mail-user=rapeek@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -J pcAngsd
#SBATCH -e slurms/02_pcAngsd.%j.err
#SBATCH -o slurms/02_pcAngsd.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=1-20:00:00

set -e # exits upon failing command
set -v # verbose -- all lines
set -x # trace of all commands after expansion before execution

# run script with
#       sbatch --mem MaxMemPerNode 02_pcAngsd.sh bamlist

# set up directories
#bams=$1 # bam directory
#code_dir="/home/rapeek/projects/SEQS/${seq}/code"
prj_dir="/group/millermrgrp3/ryan3/pulex/"
ref="/home/rapeek/projects/refgenomes/dpulex/GCA_900092285.2_PA42_4.1_genomic.fna" # ref alignment

# make results folder
mkdir -p results_pca

# move to bams folder
cd ${prj_dir}/bams

echo "Starting Job: "
date

# specify full bamlist name "whatever.bamlist"
bamlist=$1
outname=$2

nInd=$(wc ${prj_dir}/${bamlist} | awk '{print $1}')
minInd=$[$nInd/5]
#minInd=2

# PCAngsd (http://www.popgen.dk/software/index.php/PCAngsd)

## First generate genotype likelihoods in Beagle format using angsd
angsd -bam ${prj_dir}/${bamlist} -out ${prj_dir}/results_pca/${outname}_genolikes -doGlf 2 -doMajorMinor 1 -minMaf 0.05 -doMaf 2 -minInd ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-9 -GL 1 -nThreads 16 -ref $ref 
# don't use sites for this run

## then estimate covariance matrix using PCAngsd
python ~/programs/pcangsd/pcangsd.py -beagle ${prj_dir}/results_pca/${outname}_genolikes.beagle.gz -o ${prj_dir}/results_pca/${outname}_pca -threads 16

echo "Done"

