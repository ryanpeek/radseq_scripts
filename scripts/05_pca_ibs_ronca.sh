#!/bin/bash

#SBATCH --mail-user=rapeek@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -J pca_ibs
#SBATCH -e slurms/05_pca_ibs.%j.err
#SBATCH -o slurms/05_pca_ibs.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=5-20:00:00

#set -e # exits upon failing command
set -v # verbose -- all lines
set -x # trace of all commands after expansion before execution

# run script with
#       sbatch --mem MaxMemPerNode 05_pcAngsd.sh bamlistNAME bams_dir

# bamlist name (minus extension)
bamlist=$1
bams_dir=$2

# PULEX
ref="/home/rapeek/projects/refgenomes/dpulex/GCA_900092285.2_PA42_4.1_genomic.fna"
# RABO
#ref="/home/rapeek/projects/SEQS/final_contigs_300.fa" # de novo reference alignment

# make results folder
mkdir -p results_pca

# change to bams
#cd ${bams_dir}

echo "Starting Job: "
date


nInd=$(wc ${bamlist}.bamlist | awk '{print $1}')
minInd=$[$nInd/5]
#minInd=3

# PCAngsd (http://www.popgen.dk/software/index.php/PCAngsd)

## First generate genotype likelihoods in Beagle format using angsd
#angsd -bam ${bamlist}.bamlist -out results_pca/${bamlist}_genolikes -doGlf 2 -doMajorMinor 1 -minMaf 0.05 -doMaf 2 -minInd ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-9 -GL 2 -nThreads 16 -ref $ref -sites bait_lengths.txt
angsd -bam ${bamlist}.bamlist -out results_pca/${bamlist} -doIBS 1 -doCounts 1 -doMajorMinor 1 -minFreq 0.05 -maxMis ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-6 -makeMatrix 1 -doCov 1 -GL 1 -doMaf 1 -nThreads 16 -ref $ref -sites bait_lengths.txt

echo "Done!"

#angsd -bam ${bamlist}.bamlist -out results_pca/${bamlist}_genolikes -doGlf 2 -doMajorMinor 1 -minMaf 0.05 -doMaf 1 -minInd ${minInd} -minMapQ 30 -minQ 20 -SNP_pval 1e-6 -GL 2 -nThreads 16 -ref $ref -sites bait_lengths.txt


## then estimate covariance matrix using PCAngsd
#python ~/programs/pcangsd/pcangsd.py -beagle results_pca/${bamlist}_genolikes.beagle.gz -o results_pca/${bamlist}_pca -threads 16


