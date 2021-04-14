#!/bin/bash -l

list=$1 # a list with bams to merge as columns

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1, $2, $3}')   
	set -- $var
	c1=$1 # 1st bamset
	c2=$2 # 2nd bamset
	c3=$3 # 3rd bamset

	echo "#!/bin/bash -l
	
	#SBATCH -o slurm_outs/mergebams-%j.out
	#SBATCH -J mergebams

  # check paths here
	samtools merge ${c1}.merge.bam $c1 /path2/${c2} /path3/${c3}
	samtools rmdup ${c1}.merge.bam ${c1}.merge.rmdup.bam" > ${c1}.sh
	
	sbatch -t 720 -p med --mem=2G ${c1}.sh
	sleep 2 # to give a slight break btwn job assignments
	x=$(( $x + 1 ))

done

