#!/bin/bash
#SBATCH -J split_plate
#SBATCH -e slurms/00_split_plate.%j.err
#SBATCH -o slurms/00_split_plate.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=1-20:00:00

#set -e # exits upon failing command
#set -v # verbose -- all lines
#set -x # trace of all commands after expansion before execution

#This script is set grep out the 6bp 96TruSeq plus blackBarcodes - 6bp??+8bp

mkdir -p slurms

seq1=$1
seq2=$2
somm=$3

grep --no-group-separator -A3 ':TGCGCT..+GGCATACT' ${seq1} > ${somm}_TGCGCT_GGCATACT_R1.fastq
grep --no-group-separator -A3 ':GACCCT..+CTTCACCA' ${seq1} > ${somm}_GACCCT_CTTCACCA_R1.fastq
grep --no-group-separator -A3 ':ACACCT..+GAGCAGTA' ${seq1} > ${somm}_ACACCT_GAGCAGTA_R1.fastq
grep --no-group-separator -A3 ':CCTACT..+GTAGGAGT' ${seq1} > ${somm}_CCTACT_GTAGGAGT_R1.fastq
grep --no-group-separator -A3 ':TTAACT..+CTGGAGTA' ${seq1} > ${somm}_TTAACT_CTGGAGTA_R1.fastq
grep --no-group-separator -A3 ':TACTAT..+CTAGGTGA' ${seq1} > ${somm}_TACTAT_CTAGGTGA_R1.fastq
grep --no-group-separator -A3 ':TTTGAT..+GCAAGATC' ${seq1} > ${somm}_TTTGAT_GCAAGATC_R1.fastq
grep --no-group-separator -A3 ':GTGCAT..+TCAGGCTT' ${seq1} > ${somm}_GTGCAT_TCAGGCTT_R1.fastq
grep --no-group-separator -A3 ':CAACAT..+CGTGTACT' ${seq1} > ${somm}_CAACAT_CGTGTACT_R1.fastq
grep --no-group-separator -A3 ':TGCGCT..+GGCATACT' ${seq2} > ${somm}_TGCGCT_GGCATACT_R2.fastq
grep --no-group-separator -A3 ':GACCCT..+CTTCACCA' ${seq2} > ${somm}_GACCCT_CTTCACCA_R2.fastq
grep --no-group-separator -A3 ':ACACCT..+GAGCAGTA' ${seq2} > ${somm}_ACACCT_GAGCAGTA_R2.fastq
grep --no-group-separator -A3 ':CCTACT..+GTAGGAGT' ${seq2} > ${somm}_CCTACT_GTAGGAGT_R2.fastq
grep --no-group-separator -A3 ':TTAACT..+CTGGAGTA' ${seq2} > ${somm}_TTAACT_CTGGAGTA_R2.fastq
grep --no-group-separator -A3 ':TACTAT..+CTAGGTGA' ${seq2} > ${somm}_TACTAT_CTAGGTGA_R2.fastq
grep --no-group-separator -A3 ':TTTGAT..+GCAAGATC' ${seq2} > ${somm}_TTTGAT_GCAAGATC_R2.fastq
grep --no-group-separator -A3 ':GTGCAT..+TCAGGCTT' ${seq2} > ${somm}_GTGCAT_TCAGGCTT_R2.fastq
grep --no-group-separator -A3 ':CAACAT..+CGTGTACT' ${seq2} > ${somm}_CAACAT_CGTGTACT_R2.fastq
