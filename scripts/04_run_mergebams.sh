#!/bin/bash -l

#SBATCH -e slurms/mergebams_%j.err
#SBATCH -o slurms/mergebams_%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=4-20:00:00

# this merges mult seq runs (mult bamfiles) into single bams
# assumes remove dups has NOT been run yet (i.e., not using "flt.bams")

mkdir -p slurms

somm1=$1
somm2=$2

## List of bams to merge, first col is OUTNAME
## cols 2:n are bam files with full paths

# create list automatically, assumes you are in BAM dir
# cd bams
ls ${somm1}*sort.bam > list_A; ls *${somm2}*sort.bam > list_B; ls ${somm1}*sort.bam | sed "s/\.sort\.bam//g" | sed "s/${somm1}/SOMM/g" > list_noAB; paste list_* > align_list

rm list* # remove temp lists

# set list
list="align_list"

# or set in param
# list=$1 

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1, $2, $3}')   
	set -- $var
	c1=$1 # bam outname
	c2=$2 # 1st bamset
	c3=$3 # 2nd bamset, # add as needed

	echo "#!/bin/bash -l
	
	#SBATCH --mail-user=rapeek@ucdavis.edu
  #SBATCH --mail-type=ALL
	#SBATCH -o slurms/mergebams-%j.out
	#SBATCH -e slurms/mergebams-%j.err
  #SBATCH -c 20
	#SBATCH -J mergebams
  
  mkdir -p slurms
  
  # check paths are included in list file
	# change depending on columns of sequences to merge
        samtools merge ${c1}.merge.bam ${c2} ${c3}
        samtools rmdup ${c1}.merge.bam ${c1}.merge.flt.bam" > ${c1}.sh
	
	sbatch -t 720 -p med --mem=2G ${c1}.sh
	sleep 2 # to give a slight break btwn job assignments
	x=$(( $x + 1 ))

done

