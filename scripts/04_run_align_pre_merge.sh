#!/bin/bash

#SBATCH --mail-user=rapeek@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -J align
#SBATCH -e slurms/04_align_%j.err
#SBATCH -o slurms/04_align_%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=4-20:00:00

#set -e # exits upon failing command
set -v # verbose -- all lines
set -x # trace of all commands after expansion before execution

mkdir -p slurms

##  This script will align all raw fasta files. ##
##  assume running script while located in SEQS/$SOMM/fastq ##
##  Run with: sbatch 04_run_align_pre_merge.sh $SOMM 

# INPUTS
somm=$1 # the full path to the fastq files 

# switch to dir
echo "changing dir"
cd ${somm}

# make a bamlist for alignment: 3 columns, RA, RB output_name (something without AB)

# if using RADseq
# ls *RA* > list_A; ls *RB* > list_B; ls *RA* | sed "s/\_RA//g" | sed "s/\.fastq//g" > list_noAB; paste list_* > align_list

# if using NOVOseq
ls *R1* > list_A; ls *R2* > list_B; ls *R1* | sed "s/\_R1//g" | sed "s/\.fastq//g" > list_noAB; paste list_* > align_list

rm list* # remove temp lists

# set list
list="align_list"

# set reference alignment
ref="/home/rapeek/projects/refgenomes/dpulex/GCA_900092285.2_PA42_4.1_genomic.fna"
#ref="/home/rapeek/projects/SEQS/final_contigs_300.fa"
#ref=$2 # or give reference alignment

# loop through
wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1, $2, $3}')   
	set -- $var
	c1=$1 # R1 or RA
	c2=$2 # R2 or RB
	c3=$3 # outname

	echo "#!/bin/bash -l
	
	#SBATCH -o slurms/bwa_align-%j.out
	#SBATCH -e slurms/bwa_align-%j.err
  #SBATCH -c 20
	#SBATCH -J mergebams
  #SBATCH -p high


bwa mem $ref ${c1} ${c2} | samtools view -Sb - | samtools sort - -o ${c3}.sort.bam

# add ms and MC tags for markdup, requires sorted file
# samtools fixmate -m ${c3}.sort.bam ${c3}.sortfix.bam

# now look at prop pairs
samtools view -f 0x2 -b ${c3}.sort.bam > ${c3}.sortpp.bam"  > ${c3}.sh

# only for after merged: https://www.htslib.org/doc/samtools-markdup.html
#| samtools markdup -r - ${c3}.sort.flt.bam"

	sbatch --mem=8G -t 24:00:00 ${c3}.sh
	sleep 2

	x=$(( $x + 1 ))

done

