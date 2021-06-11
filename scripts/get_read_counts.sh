#!/bin/bash -l

# run with sbatch -t 300 -p high 04c_get_read_counts.sh bamlists/ronca_all.bamlist 

list=$1

wc=$(wc -l ${list} | awk '{print $1}')

#rm count?_*.txt

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

# total reads
samtools flagstat ${c1} | sed -n 1p | cut -d" " -f1 >> count1_aligns.txt

# mapped reads
samtools flagstat ${c1} | sed -n 5p | cut -d" " -f1 >> count2_mapped.txt

# paired in sequencing
samtools flagstat ${c1} | sed -n 8p | cut -d" " -f1 >> count3_paired.txt

# proper pairs
samtools flagstat ${c1} | sed -n 9p | cut -d" " -f1 >> count4_ppaired.txt

x=$(( $x + 1 ))

done

# paste the status from above together into a single file
paste $list count1_aligns.txt count2_mapped.txt count3_paired.txt count4_ppaired.txt > alignment_stats.txt

# add header row
sed -i '1ibamfile\ttotal_aligns\tmapped_aligns\tpaired_aligns\tprop_pairs' alignment_stats.txt

