#!/bin/bash -l

#SBATCH -J coverage
#SBATCH -e slurms/cover.%j.err
#SBATCH -o slurms/cover.%j.out
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
	
	#SBATCH -o slurms/coverageOut-%j.out
	#SBATCH -e slurms/coverageOut-%j.err
  #SBATCH -c 20
  #SBATCH -t 500
  #SBATCH -p high
	#SBATCH -J cover
  
  mkdir -p slurms
	
  samtools depth -a ${bamdir}/${str} | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> ${outfile}.txt" > ${str}_depth.sh
	
	sbatch ${str}_depth.sh
	
	x=$(( $x + 1 ))

done

