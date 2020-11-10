#!/bin/bash
#SBATCH -J align
#SBATCH -e slurms/04_align.err
#SBATCH -o slurms/04_align.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=4-20:00:00

set -e
set -x

#  This script will align all raw fasta files: needs a 3 column list of A, B, out.
#  	sbatch --mem MaxMemPerNode 05a_align.sh 3_col.bamlist reference_alignment.fa

## assume running script while located IN dir with fqs, make a bamlist
#list=$()
#ls *RA* > list_A; ls *RB* > list_B; ls *RA* | sed "s/\_RA//g" | sed "s/\.fastq//g" > list_noAB; paste list_* > align_list

list=$1 # give your bamlist of 3 cols RA RB output name 
ref=$2 # give reference alignment
#ref=/home/rapeek/projects/SEQS/final_contigs_300.fa

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1, $2, $3}')   
	set -- $var
	c1=$1
	c2=$2
	c3=$3

	echo "#!/bin/bash -l

bwa mem $ref ${c1} ${c2} | samtools view -Sb - | samtools sort - -o ${c3}.sort.bam
samtools view -f 0x2 -b ${c3}.sort.bam | samtools rmdup - ${c3}.sort.flt.bam" > ${c3}.sh

	sbatch --mem=8G -t 8:00:00 ${c3}.sh

	x=$(( $x + 1 ))

done

