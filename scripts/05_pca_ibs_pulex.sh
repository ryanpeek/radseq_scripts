#!/bin/bash

#SBATCH --mail-user=rapeek@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -J pca_ibs
#SBATCH -e slurms/05_pca_ibs.%j.err
#SBATCH -o slurms/05_pca_ibs.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=2-20:00:00

#set -e # exits upon failing command
set -v # verbose -- all lines
set -x # trace of all commands after expansion before execution

# run script with
#       sbatch --mem MaxMemPerNode 05_pcAngsd.sh bamlistNAME bams_dir

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
#minInd=3

# PCAngsd (http://www.popgen.dk/software/index.php/PCAngsd)

## First generate genotype likelihoods in Beagle format using angsd
#angsd -bam ${bamlist}.bamlist -out results_pca/${bamlist}_genolikes -doGlf 2 -doMajorMinor 1 -minMaf 0.05 -doMaf 2 -minInd ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-9 -GL 2 -nThreads 16 -ref $ref -sites bait_lengths.txt

angsd -bam ${prj_dir}/${bamlist} -out ${prj_dir}/results_pca/${outname} -doIBS 1 -doCounts 1 -doMajorMinor 1 -minFreq 0.05 -maxMis ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-6 -makeMatrix 1 -doCov 1 -GL 1 -doMaf 1 -nThreads 16 -ref $ref
echo "Done!"

#angsd -bam ${bamlist}.bamlist -out results_pca/${bamlist}_genolikes -doGlf 2 -doMajorMinor 1 -minMaf 0.05 -doMaf 1 -minInd ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-6 -GL 2 -nThreads 16 -ref $ref -sites bait_lengths.txt


## then estimate covariance matrix using PCAngsd
#python ~/programs/pcangsd/pcangsd.py -beagle results_pca/${bamlist}_genolikes.beagle.gz -o results_pca/${bamlist}_pca -threads 16


