#!/bin/bash -l

#SBATCH -J runsplit
#SBATCH -e runsplit.%j.err
#SBATCH -o runsplit.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=1-20:00:00


# run all
list=$1 # list of sh files to run
seq1=$2
seq2=$3
somm=$4

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ]
do 
	string="sed -n ${x}p ${list}"
	str=$($string)


sbatch ${str} ${seq1} ${seq2} ${somm}

x=$(( $x + 1 ))
	       
done

