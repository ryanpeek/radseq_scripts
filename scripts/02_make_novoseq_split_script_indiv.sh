#!/bin/bash -l


#SBATCH -p high
#SBATCH --time 2:00:00
#SBATCH -J makeSplitsh
#SBATCH -e makeSplitsh.%j.err
#SBATCH -c 20


# use barcode txt file here (each line is barcode only)
list=$1 #96TruSeq_Barcodes_only.txt
outdir=$2 # location for sh scripts

wc=$(wc -l ${list} | awk '{print $1}')

x=1
while [ $x -le $wc ]
       do
	       string="sed -n ${x}p ${list}"
	       str=$($string)
	       
	       # set up script header
	       
	       echo "#!/bin/bash -l
	       
#SBATCH --mail-user=rapeek@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -J splitNovo
#SBATCH -e splitNovo.%j.err
#SBATCH -o splitNovo.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=1-20:00:00
	       
#set -v # verbose -- all lines
#set -x # trace of all commands before execution
	       
seq1=\$1 # fq 1/A
seq2=\$2 # fq 2/B
somm=\$3 # name of SOMM
	       
grep --no-group-separator -A 3 \":${str}\" \${seq1} > ../fastq/\${somm}_${str}_R1.fastq
grep --no-group-separator -A 3 \":${str}\" \${seq2} > ../fastq/\${somm}_${str}_R2.fastq" > ${outdir}/split_novoseq_${str}.sh

	       x=$(( $x + 1 ))
	       
       done

