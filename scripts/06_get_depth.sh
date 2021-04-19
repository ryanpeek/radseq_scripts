#!/bin/bash -l

#SBATCH -J depth
#SBATCH -e slurms/depth.%j.err
#SBATCH -o slurms/depth.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=2-20:00:00

# run with "sbatch 06_get_depth.sh bamlist outfile

list=$1 # list of bams
bamdir=$2 # bam dir
outfile=$3 # the name of outfile

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ] 
do
	string="sed -n ${x}p ${list}" 
	str=$($string)
	
	echo "#!/bin/bash -l
	
	#SBATCH -o slurms/depthOut-%j.out
	#SBATCH -e slurms/depthOut-%j.err
  #SBATCH -c 20
  #SBATCH -t 500
  #SBATCH -p high
	#SBATCH -J depthout
  
  mkdir -p slurms
	
  samtools depth -a ${bamdir}/${str} | awk '{c++;s+=$3}END{print s/c}' >> ${outfile}.txt" > ${str}_depth.sh
	
	sbatch ${str}_depth.sh
	
	x=$(( $x + 1 ))

done
