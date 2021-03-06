#!/bin/bash -l

#SBATCH -J index
#SBATCH -o slurms/index_%j.out
#SBATCH -p high
#SBATCH -t 720

list=$1 # bamlist 

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)

	var=$(echo $str | awk -F"\t" '{print $1, $2}')   
	set -- $var
	c1=$1
	c2=$2

	echo "#!/bin/bash -l

	#SBATCH -J indexF
	#SBATCH -o slurms/index_F%j.out

	samtools index $c1" > ${c1}.sh 

	sbatch -t 12:00:00 -p high ${c1}.sh

	x=$(( $x + 1 ))

done


